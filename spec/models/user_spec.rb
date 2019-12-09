# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :feature do
    fixtures :users

    xit '# invalid user: empty name' do        
        user = User.new(name: '', email: 'pablo@example.com')
        expect(user).to_not be_valid       
    end

    xit '# invalid user: empty email' do   
        user = User.new(name: 'Pablo', email: '')
        expect(user).to_not be_valid            
    end    

    xit '# invalid user: invalid name' do  
        user = User.new(name: 'P', email: 'pablo@example.com')
        expect(user).to_not be_valid       
    end

    xit '# rejects aninvalid user: invalid email' do 
        user = User.new(name: 'Pablo', email: 'pablo@example')
        expect(user).to_not be_valid       
    end    

    it '# creates valid users from fixtures' do 
        expect(users(:pablo)).to be_valid
        expect(users(:ivan)).to be_valid
        expect(users(:gabriela)).to be_valid
    end   

end