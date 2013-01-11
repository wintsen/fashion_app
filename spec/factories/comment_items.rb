# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment_item do
    item nil
    user nil
    comment "MyText"
  end
end
