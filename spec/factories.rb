FactoryGirl.define do
  factory :user do
    name "Christie Shi"
    email "christshi@fashionapp.com"
    password "welcome"
    password_confirmation "welcome"
  end

  factory :item do
    user
  end
end
