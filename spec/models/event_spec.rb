RSpec.describe Event, :type => :model do

	fixtures :users, :events

	before :each do
		@user1 = users(:ivan)        
		@user2 = User.new(name: 'Pablo', email: 'pablo@example.com')
	end

	it '# create invalid event: empty description and valid date' do  
		event = Event.new(creator: @user1, description: '', date: '2019-12-05 20:45:17')
		expect(event).to_not be_valid          
	end    

	it '# creates a valid event' do    
		event = Event.new(creator: @user1, description: 'testing event', date: '2019-12-05 20:45:17')    
		expect(event).to be_valid   
	end
	
	it '# creates valid events from fixtures' do    
		expect(events(:event1)).to be_valid   
		expect(events(:event2)).to be_valid 
	end

	it '# creates a valid event through build' do
		event = @user1.events.build(description: 'testing the relation', date: '2019-12-05 20:45:17')
		expect(event).to be_valid
	end

	it '# invalid event: description length more than 50 and valid date' do
		description = "d" * 151
		event = Event.new(creator: @user1, description: description, date: '2019-12-05 20:45:17')
		event.valid?
		expect(event.errors[:description]).to include("is too long (maximum is 150 characters)")
	end

	it '# invalid event: empty date, empty description and empty creator' do
		event = Event.new(creator: nil, description: nil, date: nil)
		event.valid?
		expect(event.errors[:description]).to include("can't be blank")
		expect(event.errors[:date]).to include("can't be blank")
		expect(event.errors[:creator]).to include("can't be blank")
	end   
    
end