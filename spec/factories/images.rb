# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    original_url "MyString"
    large_url "MyString"
    medium_url "MyString"
    small_url "MyString"
    thumb_url "MyString"
    imageable nil
    imageable_type "MyString"
  end
end
