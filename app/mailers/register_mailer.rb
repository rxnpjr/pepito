class RegisterMailer < ApplicationMailer

	def register(client)
		@client = client
		mail :subject => 'Bienvenido a la tiendita',
			:to 	  => @client.email,
			:from     => ENV['GMAIL_USERNAME']
	end
end
