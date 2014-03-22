Given(/^Mark has made an order$/) do
  @customer = FactoryGirl.create :customer
  @order = @customer.orders.create!
end

When(/^he pais for it$/) do
end

Then(/^Timur marks it paid$/) do
  visit customer_orders_path(@customer)
  sign_in_as_user
  click_link 'No'
end

Then(/^he should see that the order is paid$/) do
  page.should have_content 'Order paid!'
  expect(Order.last).to be_paid
end

When(/^Timur accidently marks it paid$/) do
  @order.update_attribute :paid, true
end

Then(/^he can reset the status back to Unpaid$/) do
  visit orders_path
  sign_in_as_user
  click_link 'Yes'
end

Then(/^he should see that it is still unpaid$/) do
  page.should have_content "reset to 'Unpaid'"
  expect(Order.last).to_not be_paid
end
