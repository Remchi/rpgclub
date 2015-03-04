require 'rails_helper'

feature 'Main page' do
  scenario 'all can see main page' do
    visit '/'
    expect(page).to have_content('RPG Club')
  end
end
