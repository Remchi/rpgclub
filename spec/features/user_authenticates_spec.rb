require 'rails_helper'

feature 'User authenticates' do
  let(:user) { create(:user, password: '123456789')}

  before do
    visit '/'
    find('.sign-in-link').click
  end

  scenario 'user authenticates with username' do
    fill_in 'user_login', with: user.username
    fill_in 'user_password', with: '123456789'
    find('.sign-in-submit').click

    expect(page).to have_css('.sign-out-link')
  end

  scenario 'user authenticates with email' do
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: '123456789'
    find('.sign-in-submit').click

    expect(page).to have_css('.sign-out-link')
  end

  scenario 'user tries to log in with invalid credentials' do
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: '1234'
    find('.sign-in-submit').click

    expect(page).to have_css('.alert-danger')
    expect(page).not_to have_css('.sign-out-link')
  end

  scenario 'user logs out' do
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: '123456789'
    find('.sign-in-submit').click
    find('.sign-out-link').click

    expect(page).not_to have_css('.sign-out-link')
    expect(page).to have_css('.sign-in-link')
  end
end
