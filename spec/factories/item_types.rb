# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_type do
    name "MyString"
    default_price ""
  end
end