FactoryGirl.define do
  factory :tweet do
    content { "A" * 140 }
    user
  end

  trait :invalid do
    content { "C" * 143 }
  end
end
