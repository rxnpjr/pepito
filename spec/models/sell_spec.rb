require "rails_helper"

RSpec.describe Sell, :type => :model do

	before do
		allow_any_instance_of(Client).to receive(:send_email).and_return(nil)
	end

	context "Verify if a sell decrease product stock" do

		before do 
			@product = Product.create(ref: 'ASDF345', quantity: 10, brand: 'rxnpjr', name: 'ohmycat', description: 'miau miau', size: 'small', color: 'rojo')
			@client = Client.create(name: 'demo', email: 'demo@demo.com')
		end

		it 'save a sell with a client' do 
			sell = @client.sells.create(total: '343434') #para relacionar la venta con el cliente
			line_item = sell.line_items.create(value: 34325, quantity: 5)
			expect(sell.persisted?).to be true
		end

	end

end
