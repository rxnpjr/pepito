class Sell < ActiveRecord::Base
	validates :total, :client_id,  presence: true
	validates :total, numericality: {greater_or_equal_than: 0}


	has_many :line_items, after_add: :add_item, after_remove: :remove_item
	belongs_to :client

	def add_item(line_item)
		if line_item.valid?
			self.update_attribute(:total, self.total + line_item.value)
		end
	end

	def remove_item(line_item)
		if line_item.valid?
			self.update_attribute(:total, self.total - line_item.value)
		end
	end

end
