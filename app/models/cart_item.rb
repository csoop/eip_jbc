class CartItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :buyer
	has_many :size_groups
end
