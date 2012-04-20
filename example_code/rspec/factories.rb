FactoryGirl.define do
  sequence(:key) { |n| "key#{n}" }

  factory :locale do
    project
    key
  end

  factory :blurb do
    project
  end

  factory :localization do
    locale
    blurb
  end

  factory :version do
    localization

    factory :published_version do
      published true
    end
  end

  factory :announcement do
    body "We are going to deploy next Monday."
  end
end
