Given(/^Jon is an existing customer$/) do
  @jon = Customer.create! name: 'Jon Connor',
    address: 'Flat 4 Mulgrave road sutton surrey',
    postcode: 'SM26LU',
    phone: '07748726574',
    notes: '9am to 5pm working days'
end

When(/^he comes in with a brown jacket and a blue costume to clean$/) do
  ItemType.create! name: 'jacket', default_price: 6.to_money
  ItemType.create! name: 'costume', default_price: 8.to_money
  Color.create! name: 'blue'
  Color.create! name: 'brown'
end

When(/^he wants it to be delivered in 3 days time$/) do
  ItemType.create! name: 'delivery', default_price: 5.to_money
end

Then(/^Timur can create an order for him capturing all those details$/) do
  visit customers_path
  sign_in_as_user

  search_customer 'Jon Connor'

  click_link 'Show'
  click_link 'New Order'

  fill_in 'order_due_date', with: Time.now + 2.days

  click_link '+'
  select 'jacket', from: 'Order Items'
  click_link '+'
  select 'costume', from: 'Order Items'
  click_link '+'
  select 'delivery', from: 'Order Items'

  click_button 'Create Order'
end

Then(/^he can see the order total$/) do
  pending # express the regexp above with the code you wish you had
end
