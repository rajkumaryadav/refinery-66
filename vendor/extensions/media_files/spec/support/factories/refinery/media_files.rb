
FactoryGirl.define do
  factory :media_file, :class => Refinery::MediaFiles::MediaFile do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

