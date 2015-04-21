class Buyer < ActiveRecord::Base
	validates :ppname, :color, :category, :fabric, presence: true

  belongs_to :user
  has_many :pictures
  has_many :cart_items
  serialize :color
end
