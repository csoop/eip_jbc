class Picture < ActiveRecord::Base
  belongs_to :buyer

  mount_uploader :image, ImageUploader
end
