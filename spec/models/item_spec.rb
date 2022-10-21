require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = User.create!(name: 'Francisco', email: 'francisco@mail.com', password: '123456')
    @inventory = Inventory.create!(name: 'Inventory 1', icon: 'https://www.flaticon.com/svg/static/icons/svg/3523/3523063.svg', user_id: @user.id)
    @item = Item.create!(name: 'Item', amount: 10.00, user_id: @user.id)
  end

  it 'should have a name' do
    expect(@item.name).to eq('Item')
  end

  it 'should have an amount' do
    expect(@item.amount).to eq(10.00)
  end

  it 'should have an user' do
    expect(@item.user_id).to eq(@user.id)
  end
end
