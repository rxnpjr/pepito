require 'csv'

namespace :gen do
  desc "Lista cliente"
  task clients: :environment do
  	CSV.open('/Users/roxanna/rails_projects/pepito/clients.csv', 'w') do |csv|
  		Client.all.each do |client|
  			csv << [client.email, client.name]
  		end
  	end
  end

end
