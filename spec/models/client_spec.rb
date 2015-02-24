require "rails_helper"

RSpec.describe Client, :type => :model do

	before do
		allow_any_instance_of(Client).to receive(:send_email).and_return(nil)
	end

	it 'save a client with a name and email' do 
		client = Client.create(name: 'demo', email:'demo@demo.com')
		expect(client.persisted?).to be true
	end

	it 'client can not be saved email error' do 
		client = Client.create(name: 'demo', email:'dfsdf')
		expect(client.persisted?).to be false
		expect(client).to have(1).error_on(:email)
	end

	it 'client can not be saved name error' do 
		client = Client.create(name: '', email:'demo@demo.com')
		expect(client.persisted?).to be false
		expect(client).to have(1).error_on(:name)
	end

	context 'when client saved' do

		before do
			@client = Client.create(name: 'demo', email: 'demo@demo.com')
		end

		it 'change email to user' do 
			bool = @client.update_attribute(:email, "demo@demo.com")
			expect(bool).to be true
			expect(@client.errors.size).to eq 0
			expect(@client.email).to eq "demo@demo.com"
		end
	end

	it 'change client name'
		bold_name = @client.name
		@client.update_attribute(:name, 'esgw44')
		expect(@user.name).not_to eq old_name
	end

	it 'deletes the client' do
		@client.destroy
		expect(Client.count).to eq 0
	end

	it 'find by name' do
	client= Client.where(name: 'demo').first
	expect(@client).not_to_be nil
	end


	end


end