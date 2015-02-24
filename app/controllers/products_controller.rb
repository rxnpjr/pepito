class ProductsController < ApplicationController
	
	before_action :login_required

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		params_filtered =params.require(:product).permit(:ref, :price, :quantity, :brand, :name, :description, :size, :color)
		@product = Product.new(params_filtered)

		if @product.save
			redirect_to products_path
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

end

