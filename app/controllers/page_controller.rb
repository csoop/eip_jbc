class PageController < ApplicationController
  def welcome
    unless current_user
      redirect_to :login
    end
  end

  def calendar
  end

end