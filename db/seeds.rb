# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! email: 'artem@test.com', password: 'password', password_confirmation: 'password'

colors = %w[white black red green].map do |color|
  Color.create! name: color
end

coat     = ItemType.create! name: 'coat', default_price: 6.to_money
costume  = ItemType.create! name: 'costume', default_price: 8.to_money
delivery = ItemType.create! name: 'delivery'
offer    = ItemType.create! name: 'offer'

john = Customer.create! name: 'John Connor',
  address: 'Boston 10',
  postcode: 'SM26LU',
  phone: '444455555'

sarah = Customer.create! name: 'Sarah Connor',
  address: 'Flat 4 Mulgrave road sutton surrey',
  postcode: 'SM26LU',
  phone: '07748726574',
  notes: '9am to 5pm working days'

(1..3).each do |n|
  order = sarah.orders.create! due_date: Time.now + n.days,
    sticker_number: "#{n}_234ff33"

  order.items.create!(
    item_type: [coat, costume].sample,
    color: colors.sample,
    quantity: n
  )
  order.items.create!(
    item_type: offer,
    price: [-1,-2].sample.to_money,
    details: "#{n}0% off for new customers"
  )
  order.items.create!(
    item_type: delivery,
    price: [2,3,4].sample.to_money
  )
  order.complete! if n.odd?
end
