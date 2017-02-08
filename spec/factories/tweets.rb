FactoryGirl.define do
  factory :tweet do
    content { "A" * 140 }
    user
  end
end
