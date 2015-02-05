class Buyer < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  serialize :color
end
