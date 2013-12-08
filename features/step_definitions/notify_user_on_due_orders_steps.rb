Given(/^there is an order that must be done the day after tomorrow$/) do
  @user = FactoryGirl.create :user

  @customer = FactoryGirl.create :customer
  @due_order = @customer.orders.create! due_date: Time.now + 1.day
  @non_due_order = FactoryGirl.create :order, due_date: Time.now + 3.days
end

When(/^tomorrow comes$/) do
  User.notify_about_orders_that_due_soon_or_overdue
end

Then(/^Timur receives an email reminder$/) do
  open_email(@user.email)

  expect(current_email.subject).to match /orders are due/

  expect(current_email.body).to match /#{@due_order.sticker_number}/
  expect(current_email.body).to_not match /#{@non_due_order.sticker_number}/
end
