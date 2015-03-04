class Client < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

	has_many :sells
	after_create :send_email
	
	#para lod e las imagenes

	mount_uploader :avatar, AvatarUploader

	def current_client
		if session[:user_id]
			@current_client ||= Client.find(session[:client_id])
		end
	end


	def self.create_with_omniauth(auth)
		self.create! do |client|
			client.provider = auth['provider']
			client.uid = auth['uid']
			client.name = auth['info']['name']
			client.token = auth['credentials']['name']
			client.secret = auth['credentials']['name']
			client.url_photo = auth['info']['image']
		end
	end

# :doc_type, :doc, iban abajo
	# validates  :name, :email, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i , message: "email valido" }

	def login
		Client.where(email: self.email, password: self.password).first
	end

	def send_email
		SendEmailJob.set(wait: 30.seconds).perform_later(self)	
	end

	def self.newsletter
		Client.all.each do |client| user.send_email
		end
	end

end
