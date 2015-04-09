class Buyer < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_many :cart_items
  serialize :color
end
