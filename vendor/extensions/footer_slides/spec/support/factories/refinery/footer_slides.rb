
FactoryGirl.define do
  factory :footer_slide, :class => Refinery::FooterSlides::FooterSlide do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

