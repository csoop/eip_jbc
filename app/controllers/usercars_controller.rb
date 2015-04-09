class UsercarsController < ApplicationController
  before_action :cart_count
  before_action :set_buyer, only: [:show]
  def index
    @viewimages = Viewimage.all
  	@reception_index = Buyer.all.order("created_at desc").limit(6)
  end

  def login
  	
  end

  def history
  	
  end

  def brand
  	
  end

  def upload
    @buyer = Buyer.new(:user_id => current_user.id)
  end

  def show
    
  end

  def order
  	@reception_all=Buyer.where(:flag => 1).order(created_at: :desc)
  end

  def inspect
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
    @reception_cart=Buyer.find_by_id(params[:buyer])
  end

  def logout
    cookies.delete(:token)
    redirect_to :userlogin
  end

  private
    def cart_count
      cart = current_cart
      @cart_item = cart.cart_items.all
    end

    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    def order_params
      params.require(:usercars).permit(:fabric, :ppname, :styleid, :user_id, :color)
    end
end