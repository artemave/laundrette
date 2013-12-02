Given(/^Sarah has previously used our service$/) do
  sarah = Customer.create! name: 'Sarah Connor',
    address: 'Flat 4 Mulgrave road sutton surrey',
    postcode: 'SM26LU',
    phone: '07748726574',
    notes: '9am to 5pm working days'

  @order = sarah.orders.create! due_date: Time.now,
    sticker_number: '234ff33'

  @order.items.create!(
    service: coat,
    quantity: 2
  )
  @order.items.create!(
    service: offer,
    price: -1.to_money,
    notes: '50% off for new customers'
  )
  @order.items.create!(
    service: delivery,
    price: 5.to_money
  )
  @order.complete!
end

When(/^she comes one day and wants to clean a coat$/) do
end

Then(/^Timur can see her contact info$/) do
  visit customers_path
  sign_in_as_user

  search_customer 'Sarah'

  click_link 'Show'

  page.should have_content 'Sarah Connor'
  page.should have_content 'Flat 4 Mulgrave road sutton surrey'
  page.should have_content 'SM26LU'
  page.should have_content '07748726574'
  page.should have_content '9am to 5pm working days'
end

Then(/^he can also view her past orders$/) do
  page.should have_content @order.status
  page.should have_content @order.sticker_number
  page.should have_content @order.created_at
  page.should have_content @order.due_date
  page.should have_content @order.total
end

Then(/^he can create new order for Sarah$/) do
  page.should have_link "New Order"
end
