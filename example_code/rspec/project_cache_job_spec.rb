require 'spec_helper'

describe ProjectCacheJob do
  let(:project) { Factory.stub(:project) }
  subject { ProjectCacheJob.new(project.id) }

  before do
    Project.stubs(:find => project)
  end

  context "#perform" do
    it "updates the project's caches" do
      project.stubs(:update_caches)

      subject.perform

      Project.should have_received(:find).with(project.id)
      project.should have_received(:update_caches)
    end
  end
end
