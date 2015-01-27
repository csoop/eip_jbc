# -*- coding: utf-8 -*-
class BuyersController < ApplicationController
  def phone_upload
  	@buyer = Buyer.new
  end

  def create
  	@buyer = Buyer.new(params[:buyer])

  	respond_to do |format|
  		if @buyer.save 
  			Attachment.create(:attachment => params[:attachment], :attachmentable => @buyer) if params[:attachment]
  			format.html {redirect_to :phone_upload, notice: '上传成功'}
  			format.json {render json: @buyer, status: :created, location: @buyer}
  		else
  			format.html {render action: "new"}
  			format.json {render json: @buyer.errors, status: :unprocessable_entity }
  		end
  	end
  end
  
  def order_audit
  	
  end
end
