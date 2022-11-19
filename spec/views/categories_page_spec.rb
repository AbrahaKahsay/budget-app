require_relative '../rails_helper'

RSpec.describe 'Categories page', type: :feature do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @user = User.create(
      name: 'Abraha',
      email: 'abrahak81@gmail.com',
      password: '123456'
    )
    visit user_session_path
    fill_in 'Email', with: @user.email.to_s
    fill_in 'Password', with: @user.password.to_s
    find("input[type='submit']").click

    @category1 = Category.new(name: 'Travel', icon: 'https://png.pngtree.com/png-clipart/20220626/original/pngtree-plane-travel-logo-vector-template-png-image_8185591.png', user_id: 1)
    @category1.user_id = @user.id
    @category1.save
  end

  it 'shows the heading Categories' do
    visit categories_path
    expect(page).to have_content('Categories')
  end

  it 'shows the Travel category name' do
    visit categories_path
    expect(page).to have_content('Travel')
  end

  it 'shows the Add category button' do
    visit categories_path
    expect(page).to have_content('Add Category')
  end

end