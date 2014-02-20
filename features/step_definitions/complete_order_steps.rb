Given(/^there is a new order$/) do
  customer = FactoryGirl.create :customer
  customer.orders.create!
end

When(/^it is complete and picked up$/) do
end

Then(/^Timur can mark it complete$/) do
  visit orders_path
  sign_in_as_user
  click_link 'Edit'
  select 'Complete', from: 'Status'
  click_button 'Update Order'

  expect(Order.last.status).to eq("Complete")
end

Then(/^he should see that it is complete$/) do
  page.should have_content 'Complete'
end
