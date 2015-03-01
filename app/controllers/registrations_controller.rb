class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params.require(:user).permit(:email, :password))
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "You successfully signed up!"
      redirect_to root_path
    else
      @user = user
      render :new
    end
  end

end
