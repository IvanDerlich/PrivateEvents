require 'rails_helper'

RSpec.describe 'Log in and out', type: :feature do

    scenario '#unsuccessful login' do
        user = User.create!(name: 'Jon')
        visit login_path
        fill_in 'Email', with: 'wrongemail@example.com'
        click_on 'Login'
        expect(page).to have_content('Invalid login information')
    end

    scenario '#cant login with empty email' do
        user = User.create!(name: 'Jon')
        visit login_path
        fill_in 'Email', with: ''
        click_on 'Login'
        expect(page).to have_content('Invalid login information')
    end

    scenario '#reject unauthorized access to user home' do
        user = User.create!(name: 'Nonexistent')
        visit user_path(user)       
        expect(page).to have_content('Please log in')
    end


    scenario '#successfull login followed by logout' do
        user = User.create!(name: 'Prueba')
        visit login_path
        fill_in 'Email', with: 'prueba@example.com'
        click_on 'Login'
        #visit user_path(user)
        expect(page).to have_content('Log out')
        #logout tests
    end  
    
    
end