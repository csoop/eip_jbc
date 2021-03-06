class CartsController < ApplicationController
	
	def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def orders
    @orders = Cart.all.where(:flag => 1).order(created_at: :desc)
  end

  def exports
    @exports = Array.new
    @order = Cart.all.where(:flag => 1).order(created_at: :desc)
    @order.each do |export|
      export.cart_items.each do |e|
        @exports << e
      end
    end
    respond_to do |format|
      format.html
      format.xlsx {render xlsx: 'exports',filename: "exports-#{Time.now.to_date}.xlsx"}
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  # :user_id => current_user.id 订单车获取用户id
  def cart_params
    params[:cart, :user_id => current_user.id]
  end

end
