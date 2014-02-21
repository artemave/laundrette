# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! email: 'artem@test.com', password: 'password', password_confirmation: 'password'
User.create! email: 'timur.kesaev@googlemail.com', password: 'password', password_confirmation: 'password'

coat     = Service.create! name: 'dry cleaning', default_price_per_item: 6.to_money
costume  = Service.create! name: 'laundry', default_price_per_item: 8.to_money
ironing  = Service.create! name: 'ironing', default_price_per_item: 3.to_money
delivery = Service.create! name: 'delivery'
offer    = Service.create! name: 'offer'

john = Customer.create! name: 'John Connor',
  address: 'Boston 10',
  postcode: 'SM26LU',
  phone: '444455555'

sarah = Customer.create! name: 'Sarah Connor',
  address: 'Flat 4 Mulgrave road sutton surrey',
  postcode: 'SM26LU',
  phone: '07748726574',
  notes: '9am to 5pm working days'

Customer.create! name: "Terminator",
  address: '134 Skynet'

[sarah, john].each do |customer|
  (1..15).each do |n|
    order = customer.orders.create! due_date: Time.now + n.days,
      sticker_number: "#{n}_234ff33_#{customer.name.first}",
      paid: rand(3) == 0 ? true : false,
      status: rand(2) == 0 ? 'New' : 'Complete'

    order.items.create!(
      service: [coat, costume].sample,
      quantity: n
    )
    order.items.create!(
      service: offer,
      price: [-1,-2].sample.to_money,
      notes: "#{n}0% off for new customers"
    )
    order.items.create!(
      service: delivery,
      price: [2,3,4].sample.to_money
    )
  end
end
