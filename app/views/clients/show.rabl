object :@client

attributes :id, :name, :email, :avatar

node(:url){
	
	@client.avatar.url

}
