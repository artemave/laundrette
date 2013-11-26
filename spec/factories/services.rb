# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    name "MyString"
    default_price_per_item 2.to_money
  end
end
