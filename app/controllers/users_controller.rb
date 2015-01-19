class UsersController < ApplicationController
  def register
  	@user = User.new
  end

  def create_login_session
  	user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:token] = user.token
      else
        cookies[:token] = user.token
      end
      flash.notice = "登录成功！"
      redirect_to :root
    else
      flash.notice = "用户名或密码错误！"
      redirect_to :login
    end
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      cookies[:token] = @user.token
      redirect_to :root
    else
      render :register
    end
  end

  def logout
    cookies.delete(:token)
    redirect_to :login
  end

  private
   def user_params
     params.require(:user).permit!
   end
end