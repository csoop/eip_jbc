class Buyer < ActiveRecord::Base
  belongs_to :user
  has_many :attachments, :as => :attachmentable
end