Given(/^Mark has made an order$/) do
  @customer = FactoryGirl.create :customer
  @customer.orders.create!
end

When(/^he pais for it$/) do
end

Then(/^Timur marks it paid$/) do
  visit edit_customer_order_path(@customer, @customer.orders.first)
  sign_in_as_user
  check 'Paid'
  click_button 'Update'
end

Then(/^he should see that the order is paid$/) do
  visit orders_path
  page.should have_content 'Yes'
end
