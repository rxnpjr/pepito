class OmniSessionsController < ApplicationController
	def create
		auth = request.env['ominiauth.auth']
		client =  Client.where(provider: auth['provider'], uid: auth['uid'].first ||
			Client.create_with_omniauth)(auth)

	session[:client_id] = client.client_id
	redirect_to root_path 
	end
end
