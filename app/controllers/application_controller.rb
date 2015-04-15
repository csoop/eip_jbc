class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def current_user
  	@current_user ||= User.find_by_token!(cookies[:token]) if cookies[:token]
  end

  def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart=Cart.create(:user_id => current_user.id)
        session[:cart_id]=cart.id
        cart
  end

  helper_method :current_user

end
