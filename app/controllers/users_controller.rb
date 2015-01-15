class UsersController < ApplicationController
  def welcome
  end

  def login
  end

  def register
  	@user = User.new
  end
end
