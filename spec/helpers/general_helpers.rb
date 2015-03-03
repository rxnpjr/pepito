module GeneralHelpers
	def stub_user
		allow_any_instance_of(Client).to receive(:send_email).and_return(nil)
	end

	def create_user
		@client = Client.create(name: 'demo', email: 'demo@demo.com')
	end

end