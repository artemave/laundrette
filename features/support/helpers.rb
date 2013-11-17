module Stuff
  def coat
    @coat ||= FactoryGirl.create :item_type, name: 'coat', default_price: 5.to_money
  end

  def offer
    @offer ||= FactoryGirl.create :item_type, name: 'offer'
  end

  def delivery
    @delivery ||= FactoryGirl.create :item_type, name: 'delivery'
  end

  def white
    @white ||= Color.create! name: 'white'
  end

  def sign_in_as_user
    @user ||= FactoryGirl.create :user
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
  end

  def search_customer name
    fill_in 'Name contains', with: name
    click_button 'Search'
  end
end

World(Stuff)
