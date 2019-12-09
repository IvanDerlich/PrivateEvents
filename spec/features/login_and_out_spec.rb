require 'rails_helper'

RSpec.describe 'Log in and out', type: :feature do

    fixtures :users

    scenario '# unsuccessful login' do
        visit login_path
        fill_in 'Email', with: 'wrongemail@example.com'
        click_on 'Login'
        expect(page).to have_content('Invalid login information')
    end

    scenario "# can't login with empty email" do
        visit login_path
        fill_in 'Email', with: ''
        click_on 'Login'
        expect(page).to have_content('Invalid login information')
    end

    scenario '# rejects unauthorized access to user home' do
        visit "/users/1"
        expect(page).to have_content('Please log in')
    end

    scenario '# successfull login followed by logout' do
        user = users(:pablo)
        expect(user.name).to match("Pablo")
        visit login_path
        fill_in 'Email', with: user.email
        click_on 'Login'
        expect(page).to have_content('Log out')
        click_on 'logout'
        expect(page).to have_content('Log in')
    end   
end