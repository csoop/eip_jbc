class PageController < ApplicationController
  def welcome
    unless current_user
      redirect_to :login
    end
    @buyer_count = Buyer.all.size
    @new_count = Buyer.all.where(flag: 0).size
  end

  def calendar
  end

end