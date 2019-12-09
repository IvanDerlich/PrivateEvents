RSpec.describe 'Event', type: :feature do

    fixtures :users, :events

    before :each do
        @user1 = users(:ivan)        
        @user2 = User.new(name: 'Pablo', email: 'pablo@example.com')
    end

    it '# create invalid event: empty description' do  
        event = Event.new(creator: user, description: '', date: '')
        expect(event).to_not be_valid          
    end    

    xit '#invalid event: empty date' do        
    end    

    xit '#invalid event: invalid description' do        
    end

    xit '#invalid event: invalid date' do        
    end

    it '# creates a valid event' do    
        event = Event.new(creator: @user1, description: 'testing event', date: '')    
        expect(event).to be_valid   
    end
    
    it '# creates valid events from fixtures' do    
        expect(events(:event1) ).to be_valid   
        expect(events(:event2) ).to be_valid 
    end
end