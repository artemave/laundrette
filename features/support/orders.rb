module KnowsAboutOrders
  def set_notes notes
    fill_in 'Notes', with: notes
    @expected_notes = notes
  end

  def set_due_date date
    fill_in 'order_due_date', with: date
    @expected_due_date = date
  end

  def remove_last_item
    within 'tbody tr:last-child' do
      click_link 'remove'
    end
    @expected_order_items.pop
  end

  def add_order_item service, notes, quantity, price = nil
    click_link 'Add Item'

    within 'tbody tr:last-child' do
      select service, from: 'Service'
      fill_in 'Notes', with: notes
      fill_in 'Quantity', with: quantity
      fill_in 'Price', with: price if price
    end

    (@expected_order_items ||= []) << {service: service, notes: notes, quantity: quantity, price: price}
  end
end
World(KnowsAboutOrders)
