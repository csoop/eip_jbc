class SizeGroupsController < ApplicationController
	def new
		@size_groups = SizeGroup.new
	end


  def update
    # data = Array.new
    # params.keys().each do |key|
    #   data << key if key.is_a?(Integer) 
    # end
    # size_groups = SizeGroup.find(data)
    # if size_groups
    #   size_groups.each do |size_group|
    #     size_group.update_attribute(:count, params[size_group.id.to_s])
    #     # size_group.count = params[size_group.id.to_s]
    #     # size_group.save
    #   end
    #   redirect_to '/inspect'
    # else
    #   redirect_to '/userweb'
    # end
    
    params.keys().each do |key|
      if key.to_i != 0
        if key.to_i.is_a?(Integer)
        #puts "#{key.to_i}"
        data = key.to_i
        size_group = SizeGroup.find(data)
        size_group.update_attribute(:count, params[size_group.id.to_s])
        end
      end
    end
    size_update = Cart.find(session[:cart_id])
    size_update.flag = 1
    size_update.save
    session[:cart_id] = nil
    redirect_to '/inspect'

    # SizeGroup.all.each do |size_group|
    #   if !size_group.count
    #     size_group.update_attribute(:count, params[size_group.id.to_s])
    #   end
    # end

    # respond_to do |format|
    #   if @size_group.update(size_group_params)
    #     format.html { redirect_to @size_group, notice: '提交成功.' }
    #     format.json { render :show, status: :ok, location: @size_group }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @size_group.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private


  # Never trust parameters from the scary internet, only allow the white list through.
    def size_group_params
      params.permit(:buyer_id, :cart_id, :color)
    end
end
