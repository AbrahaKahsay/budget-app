require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Abraha',
      email: 'abrahak81@gmail.com',
      password: '123456'
    )
    @category = Category.create(name: 'Category', icon: 'Icon1', user_id: @user.id)
  end

  it 'Name must be present' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'Icon must be present' do
    @category.name = nil
    expect(@category).to_not be_valid
  end
end
