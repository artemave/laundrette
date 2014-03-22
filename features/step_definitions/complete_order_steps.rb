Given(/^there is a new order$/) do
  @customer = FactoryGirl.create :customer
  @order = @customer.orders.create!
end

When(/^it is complete and picked up$/) do
end

Then(/^Timur can mark it complete$/) do
  visit orders_path
  sign_in_as_user
  click_link 'New'
end

Then(/^he should see that it is complete$/) do
  page.should have_content 'Order complete!'
  expect(Order.last.status).to eq("Complete")
end

When(/^Timur accidently marks it complete$/) do
  @order.complete!
end

Then(/^he can reset the status back to New$/) do
  visit customer_orders_path @customer
  sign_in_as_user
  click_link 'Complete'
end

Then(/^he should see that it is still new$/) do
  page.should have_content "reset to 'New'"
  expect(Order.last.status).to eq("New")
end
