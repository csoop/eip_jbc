class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :cart_items
	def add_buyer(cart_item_params)
		current_item = cart_items.find_by_buyer_id(cart_item_params[:buyer_id]) && cart_items.find_by_color(cart_item_params[:color])
  	if !current_item
  		current_item = cart_items.build(cart_item_params)
  	else
  		current_item = nil
  	end
  end
end
