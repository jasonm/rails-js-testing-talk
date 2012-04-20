require 'spec_helper'

describe Project do
  it { should have_many(:blurbs).dependent(:destroy) }
  it { should have_many(:locales).dependent(:destroy) }
  it { should have_many(:localizations).through(:blurbs) }
  it { should belong_to(:draft_cache).dependent(:destroy) }
  it { should belong_to(:published_cache).dependent(:destroy) }

  it "should require case-sensitive unique values for api_key" do
    project = Factory(:project)
    other_project = Factory(:project)
    project.api_key = other_project.api_key

    project.should_not be_valid
    project.errors[:api_key].should == ["has already been taken"]
  end

  it "should set the API key on create" do
    project = Factory.build(:project)
    project.api_key = nil

    project.save

    project.api_key.should_not be_nil
  end

  it "publishes the latest version of each localization on deploy" do
    project = Factory(:project)
    other_project_localization = Factory(:localization, :draft_content => "ignore me")
    project.create_defaults(
      'en.one' => 'publish me',
      'en.two' => 'me too'
    )
    project.localizations.each do |localization|
      localization.published_content.should be_empty
    end

    project.deploy!

    project.localizations.each do |localization|
      localization.reload.published_content.should == localization.draft_content
    end
    other_project_localization.reload.published_content.should be_empty
  end

  it "returns draft hash" do
    project = Factory(:project)
    project.create_defaults("en.test.key" => "value")

    project.reload.draft_json.should == { "en.test.key" => "value" }.to_json
  end

  it "returns published hash" do
    project = Factory(:project)
    project.create_defaults("en.test.key" => "value")
    project.deploy!
    project.blurbs.first.localizations.first.revise(:content   => "new value",
                                                    :published => false).save!

    project.reload.published_json.should == { "en.test.key" => "value" }.to_json
  end

  it "returns a different draft etag after updating draft content" do
    project = Factory(:project)
    project.create_defaults('en.test.one' => 'value')
    original_etag = project.reload.etag
    Timecop.travel(1.second.from_now)

    project.blurbs.first.localizations.first.revise(:published => false,
                                                    :content   => 'new value').save!

    project.reload.etag.should_not == original_etag
  end

  it "returns the same draft etag without updating draft content" do
    project = Factory(:project)
    project.create_defaults('en.test.one' => 'value')
    original_etag = project.reload.etag
    Timecop.travel(1.second.from_now)

    project.reload.etag.should == original_etag
  end

  it "updates the etag when a blurb is deleted" do
    project = Factory(:project)
    project.create_defaults('en.test.one' => 'value')
    project.deploy!
    project.reload
    original_etag = project.etag
    Timecop.travel(1.second.from_now)

    project.blurbs.first.destroy
    project.reload

    project.etag.should_not == original_etag
  end

  it "updates etag when deployed" do
    project = Factory(:project)
    project.create_defaults('en.test.one' => 'value')
    project.deploy!
    project.create_defaults('en.test.two' => 'value')
    project.reload
    original_etag = project.etag
    Timecop.travel(1.second.from_now)

    project.deploy!

    project.reload.etag.should_not == original_etag
  end

  it "generates cached json" do
    project = Factory(:project)
    project.create_defaults("en.test.key" => "value")
    project.deploy!
    project.blurbs.first.localizations.first.revise(:content   => "new value",
                                                    :published => false).save!
    TextCache.update_all("data = ''")

    Project.regenerate_caches

    project.reload
    project.draft_json.should == { "en.test.key" => "new value" }.to_json
    project.published_json.should == { "en.test.key" => "value" }.to_json
  end

  it "starts with an English locale" do
    Factory(:project).locales.map(&:key).should == %w(en)
  end

  it "uses a LockingDefaultCreator to create defaults" do
    locking_default_creator = stub('Locking default creator', :create => true)
    LockingDefaultCreator.stubs(:new => locking_default_creator)

    default_creator = stub('Default creator')
    DefaultCreator.stubs(:new => default_creator)

    redis_lock = stub('Lock')
    redis_lock.stubs(:retry => redis_lock)
    RedisLock.stubs(:new => redis_lock)

    project = Factory(:project)
    defaults = stub('Defaults')
    lock_name = project.lock_key_for_creating_defaults

    project.create_defaults(defaults)

    RedisLock.should have_received(:new).with(REDIS, lock_name)
    redis_lock.should have_received(:retry).with([0])
    DefaultCreator.should have_received(:new).with(project, defaults)
    LockingDefaultCreator.should have_received(:new).with(redis_lock, default_creator)
    locking_default_creator.should have_received(:create)
  end

  it "knows its lock key for creating defaults" do
    project = Factory(:project)
    project.lock_key_for_creating_defaults.should == "project-#{project.id}-create-defaults"
  end

  context "#default_locale" do
    it "returns English" do
      project = Factory(:project)
      Factory(:locale, :key => 'es', :project => project)
      project.default_locale.key.should == 'en'
    end
  end

  context "#able_to_add_more_locales?" do
    let(:plan) { Factory(:plan) }
    let(:account) { Factory(:account, :plan => plan) }
    subject { Factory(:project, :account => account) }

    def limit_locales(value)
      Factory(:limit,
              :plan       => plan,
              :name       => 'locales',
              :value      => value,
              :value_type => 'number')
    end

    it "returns true with locales fewer than the account limit" do
      limit_locales(2)
      subject.should be_able_to_add_more_locales
    end

    it "returns false with locales equal to the account limit" do
      limit_locales(1)
      subject.should_not be_able_to_add_more_locales
    end

    it "returns true when unlimited" do
      subject.should be_able_to_add_more_locales
    end
  end
end
