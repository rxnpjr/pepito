require "rails_helper"
RSpec.describe ClinetsController, :type => :controller do 

	before do
		stub_user
		@user = create_user
	end

	it 'GET #index' do
		get :index
		expect(response).to be_success
		expect(response).to have_http_status(200)
	end

	it "renders the index template" do
		get :index
		expect(response).to render_template("index")
	end

	it "loads all of the clients in the @clients"
	get :index
		expect (assigns(:clients)).to match_array([@client])
	end

	it "load the client" do
		get :show, :id: @client
		expect(response).to be_success
	end

	it "change the user email" do
		new_email = 'demo123@demo.com'
		patch :update, id: @client, client:{
			email: new_email
		}
		expect(response).to redirect_to clients_path
		expect(Client.first.email).to eq new_email
	end

	it "change the user email but fails" do
		new_email = 'demo123'
		patch :update, id: @client, client:{
			email: new_email
		}
		expect(response).to  render_template("edit")
		expect(Client.first.email).not_to eq new_email
	end

	# context 'POST #create' do
	# 	it 'create a new client' do
	# 		post :create, :client {
	# 			email: new_email
	# 		}
	# 	expect(response).to redirect_to clients_path
	# 	expect(response).to have_http_status(300)

	# end

end

end