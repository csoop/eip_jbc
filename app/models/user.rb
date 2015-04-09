class User < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:token) }
  validates :name, :email, presence: true
  validates :name, :email, uniqueness: { case_sensitive: false} 
  has_many :buyers
  has_many :carts

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end

end