# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    due_date "2013-11-17 18:59:58"
    customer
  end
end
