require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(name: 'Francisco', email: 'francisco@mail.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'should have a name' do
    expect(@user.name).to eq('Francisco')
  end

  it 'should have a email' do
    expect(@user.email).to eq('francisco@mail.com')
  end
end
