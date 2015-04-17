class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:destroy]
	def new
		@cart_items = CartItem.new
	end

  # 判断buyer的品类（即尺码组）来创建不同的SizeGroup
	def create
    if params[:color] != nil
  		@cart=current_cart
      buyer=Buyer.find(params[:buyer_id])
      @cart_item = @cart.add_buyer(cart_item_params)
      if @cart_item
        @cart_item.save
        if @cart_item.buyer.category == '男鞋'
          (37..44).each do |num|
            @cart_item.size_groups.create( :sizecode => num )
          end
        elsif @cart_item.buyer.category == '女鞋'
          (34..39).each do |num|
            @cart_item.size_groups.create( :sizecode => num )
          end
        else
          (36..44).each do |num|
            @cart_item.size_groups.create( :sizecode => num*10 )
          end
        end
      end
      flash.notice = "添加成功"
      redirect_to controller: "usercars", action: "detail", buyer: buyer.id
    else
      flash.notice = "未选择颜色"
      redirect_to controller: "usercars", action: "detail", buyer: buyer.id
    end
	end

  # 只针对颜色更新数量的update方法（size_groups 中为尺码的数量）
  # def update
  #   # data = Array.new
  #   # params.keys().each do |key|
  #   #   data << key if key.is_a?(Integer) 
  #   # end
  #   # cart_items = CartItem.find(data)
  #   # if cart_items
  #   #   cart_items.each do |cart_item|
  #   #     cart_item.update_attribute(:count, params[cart_item.id.to_s])
  #   #     # cart_item.count = params[cart_item.id.to_s]
  #   #     # cart_item.save
  #   #   end
  #   #   redirect_to '/inspect'
  #   # else
  #   #   redirect_to '/userweb'
  #   # end
    
  #   params.keys().each do |key|
  #     if key.to_i != 0
  #       if key.to_i.is_a?(Integer)
  #       # puts "#{key.to_i}"
  #       data = key.to_i
  #       cart_item = CartItem.find(data)
  #       cart_item.update_attribute(:count, params[cart_item.id.to_s])
  #       end
  #     end
  #   end
  #   cart_update = Cart.find(session[:cart_id])
  #   cart_update.flag = 1
  #   cart_update.save
  #   session[:cart_id] = nil
  #   redirect_to '/inspect'

  #   # CartItem.all.each do |cart_item|
  #   #   if !cart_item.count
  #   #     cart_item.update_attribute(:count, params[cart_item.id.to_s])
  #   #   end
  #   # end

  #   # respond_to do |format|
  #   #   if @cart_item.update(cart_item_params)
  #   #     format.html { redirect_to @cart_item, notice: '提交成功.' }
  #   #     format.json { render :show, status: :ok, location: @cart_item }
  #   #   else
  #   #     format.html { render :edit }
  #   #     format.json { render json: @cart_item.errors, status: :unprocessable_entity }
  #   #   end
  #   # end
  # end

  def destroy
    @cart_item.destroy
    # 并删除尺码组中的关联项
    @cart_item.size_groups.destroy
    respond_to do |format|
      format.html { redirect_to '/inspect', notice: '删除成功.' }
      format.json { head :no_content }
    end
  end

  private

    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.permit(:buyer_id, :cart_id, :color)
    end
end
