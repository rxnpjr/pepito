class Product < ActiveRecord::Base
	validates :ref, :price, :quantity, :size, :brand, :name, :description, :color, presence: true
	validates :ref, format: { with: /\A[0-9A-Z]+\z/ , message: "no es valido" }
	validates :size, length: { in: 1..10}
	 validates :size, inclusion: { in: %w(small medium large), message: "%{value} is not a valid size" }
	validates :price, numericality: {greater_than: 0}
	validates :ref, uniqueness:{message: "ya esta registrado!"}


	has_many :line_items
end
