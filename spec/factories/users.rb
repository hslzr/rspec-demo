FactoryGirl.define do
  factory :user do
    name "Pepe"
    email "p.gomez@hlcn.mx"
    password "password"
    password_confirmation "password"
    role 0
  end

  trait :admin do
    role 1
  end
end
