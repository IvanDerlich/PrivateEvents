# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create event', type: :feature do
  fixtures :users

  it '# create event succesfully' do
    user = users(:pablo)
    expect(user.name).to match('Pablo')
    visit login_path
    fill_in 'Email', with: user.email
    click_on 'Login'
    visit new_event_path
    fill_in 'Description', with: 'Description example'
    click_button 'Create event'
    expect(page).to have_content('Description example')
  end

  it '# create event unsuccesfully' do
    user = users(:pablo)
    expect(user.name).to match('Pablo')
    visit login_path
    fill_in 'Email', with: user.email
    click_on 'Login'
    visit new_event_path
    fill_in 'Description', with: ''
    click_button 'Create event'
    expect(page).to have_css('div#error_explanation')
  end
end
