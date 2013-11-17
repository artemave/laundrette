# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    color "MyString"
    price ""
    details "MyText"
    quantity 1
  end
end
