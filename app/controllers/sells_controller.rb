class SellsController < ApplicationController
	 def index
  	@sells = Sell.all
  	#puts "#{clients.inspect}"
  end
    def show
  	@sell = Sell.find(params[:id])

  end
end
