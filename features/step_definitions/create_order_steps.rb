Given(/^Jon is an existing customer$/) do
  @jon = Customer.create! name: 'Jon Connor',
    address: 'Flat 4 Mulgrave road sutton surrey',
    postcode: 'SM26LU',
    phone: '07748726574',
    notes: '9am to 5pm working days'
end

Given(/^Rob is a first timer$/) do
end

When(/^he comes in with a pair of trousers to clean$/) do
end

Then(/^Timur creates a customer account for him with all his contact info$/) do
  visit customers_path
  sign_in_as_user

  click_link 'New Customer'

  fill_in 'Name', with: 'Rob'
  fill_in 'Address', with: '12 Mulgrave road'
  fill_in 'Postcode', with: 'SM1 5JS'
  fill_in 'Phone', with: '07742345678'
  fill_in 'Notes', with: 'Deliver after 7pm'

  click_button 'Create Customer'

  @rob = Customer.last

  @rob.name.should == 'Rob'
  @rob.address.should == '12 Mulgrave road'
  @rob.postcode.should == 'SM1 5JS'
  @rob.phone.should == '07742345678'
  @rob.notes.should == 'Deliver after 7pm'
end

When(/^he comes in with a brown jacket and a costume to clean$/) do
  Service.create! name: 'dry cleaning', default_price_per_item: 6.to_money
  Service.create! name: 'laundry', default_price_per_item: 8.to_money
end

When(/^he wants it to be delivered in 3 days time$/) do
  Service.create! name: 'delivery', default_price_per_item: 5.to_money
end

Then(/^Timur can create an order for him capturing all those details$/) do
  visit customers_path
  sign_in_as_user

  search_customer 'Jon Connor'

  click_link 'Show'
  click_link 'New Order'

  fill_in 'order_due_date', with: Time.now + 2.days

  fill_in 'Notes', with: 'urgent delivery 3 days'

  add_order_item "dry cleaning", "coat, jacket", 2
  add_order_item "laundry", "coat", 1, '4.50'
  add_order_item "delivery", "urgent", 1, '5.20'
end

def add_order_item service, notes, quantity, price = nil
  click_link 'Add Item'

  within 'tbody tr:last-child' do
    select service, from: 'Service'
    fill_in 'Notes', with: notes
    fill_in 'Quantity', with: quantity
    fill_in 'Price', with: price if price
  end
end

Then(/^he can link the order to the sticker number$/) do
  fill_in 'order_sticker_number', with: '234hhhb'
end

Then(/^he can see the order total$/) do
  page.should have_content '21.70'
end

Then(/^he can submit this new order$/) do
  click_button 'Create Order'
  page.should have_content 'Order was successfully created'
end

Then(/^then creates an order for his account$/) do
  click_link 'New Order'
  click_button 'Create Order'

  expect(Order.last.customer).to eq(@rob)
end
