class UsercarsController < ApplicationController
  before_action :set_buyer, only: [:show]
  before_action :cart_ture, except: [:login]
  def index
    cart = Cart.find_by(:flag => 0, :user_id => current_user)
    if cart
      session[:cart_id]=cart.id
      @cart_item = cart.cart_items.all
    end
    @viewimages = Viewimage.all
  	@reception_index = Buyer.all.where(:flag => 1).order("created_at desc").limit(6)
  end

  def login
  	
  end

  def history
  	
  end

  def brand
  	
  end

  def upload
    if current_cart
      cart = current_cart
      @cart_item = cart.cart_items.all
    end
    @buyer = Buyer.new(:user_id => current_user.id)
  end

  def show
    
  end

  def order
  	@reception_all=Buyer.where(:flag => 1).order(created_at: :desc)
  end

  def inspect
    if current_cart
      cart = current_cart
      @cart_item = cart.cart_items.all
    end
    #cart = current_cart
    #@cart_item = cart.cart_items.all
  end

  def create
    @usercar = Order.new(order_params)
  end 

  def reception_new
    @buyer = Buyer.new
  end

  def detail
    if current_cart
      cart = current_cart
      @cart_item = cart.cart_items.all
    end
    @reception_cart=Buyer.find_by_id(params[:buyer])
  end

  def logout
    cookies.delete(:token)
    session[:cart_id] = nil
    redirect_to :userlogin
  end

  private

    def cart_ture
      if current_cart
        cart = current_cart
        @cart_item = cart.cart_items.all
      end
    end

    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    def order_params
      params.require(:usercars).permit(:fabric, :ppname, :styleid, :user_id, :color)
    end
end