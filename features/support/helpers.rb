module Stuff
  def coat
    @coat ||= FactoryGirl.create :service, name: 'coat', default_price_per_item: 5.to_money
  end

  def offer
    @offer ||= FactoryGirl.create :service, name: 'offer'
  end

  def delivery
    @delivery ||= FactoryGirl.create :service, name: 'delivery'
  end

  def sign_in_as_user
    @user ||= FactoryGirl.create :user
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
  end

  def search_customer name
    fill_in 'Search', with: name
    click_button 'Search'
  end
end

World(Stuff)
