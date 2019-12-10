require 'rails_helper'

RSpec.describe 'Log in and out', type: :feature do
	it '# unsuccessful signup' do
		visit signup_path
		fill_in 'Name', with: ''
		fill_in 'Email', with: 'jose@example.com'
		click_button 'Sign Up'
		expect(page).to have_css("div#error_explanation")
	end

	it '# successful signup' do
		visit signup_path
		fill_in 'Name', with: 'Jose Lopez'
		fill_in 'Email', with: 'jose@example.com'
		click_button 'Sign Up'
		expect(page).to have_content('Account created successfully')
	end
end