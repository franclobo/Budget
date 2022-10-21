require 'rails_helper'

RSpec.describe Inventory, type: :model do
  before do
    @user = User.create!(name: 'Francisco', email: 'francisco@mail.com', password: '123456')
    @inventory = Inventory.create!(name: 'Inventory 1',
                                   icon: 'https://www.flaticon.com', user_id: @user.id)
  end

  it 'should have a name' do
    expect(@inventory.name).to eq('Inventory 1')
  end

  it 'should have an icon' do
    expect(@inventory.icon).to eq('https://www.flaticon.com')
  end

  it 'should have an user' do
    expect(@inventory.user_id).to eq(@user.id)
  end
end
