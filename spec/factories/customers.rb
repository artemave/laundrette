# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "MyString"
    address "MyString"
    postcode "MyString"
    phone "MyString"
    notes "MyText"
  end
end
