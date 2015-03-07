require 'rails_helper'

feature 'User signs up' do
  scenario 'user signs up with valid data' do
    visit '/'
    expect(page).not_to have_css('.sign-out-link')
    expect(page).to have_css('.sign-up-link')

    find('.sign-up-link').click
    fill_in 'user_email', with: 'some@mail.com'
    fill_in 'user_username', with: 'username'
    fill_in 'user_password', with: '123456789'
    fill_in 'user_password_confirmation', with: '123456789'
    find('.sign-up-submit').click

    expect(page).to have_css('.sign-out-link')
    expect(page).not_to have_css('.sign-up-link')
    expect(User.last.username).to eq('username')
  end

  scenario 'user tries to sign up with invalid data' do
    visit '/'
    find('.sign-up-link').click
    find('.sign-up-submit').click
    
    expect(page).to have_css('.error')
    expect(current_path).to eq('/users')
  end
end
