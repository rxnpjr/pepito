class LineItem < ActiveRecord::Base
	belongs_to :product
	belongs_to :sell
	
	validates :sell_id, :product_id, :quantity, presence: true
	validates :quantity, numericality: {greater_than: 0}
# sin s porque es personalizada la validación
	validate :validate_stock

	before_create :init_value
	after_create :update_stock

	after_destroy :add_stock

	def init_value
		self.value = self.quantity*self.product.price

	end

	def update_stock
		self.product.update_attribute(:quantity, self.product.quantity - self.quantity)

	end

	def validate_stock
		if self.quantity > self.product.quantity
			errors.add(:quantity, "no hay stock")
		end

	end

	def add_stock
		self.product.update_attribute(:quantity, self.product.quantity + self.quantity)
	end

end
