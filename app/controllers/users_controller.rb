class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    #signup_password = BCrypt::Password.create(params[:user][:pass])
    #u = User.new(uid: params[:user][:uid], pass: signup_password)
    #u.save
    #redirect_to users_path
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'ユーザーが登録されました。'
    else
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end