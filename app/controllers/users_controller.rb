class UsersController < ApplicationController
  
  def index
    @users= User.all
  end
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end 

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:img, :name, :email, :profile))
      flash[:notice] = "#{@user.name}の情報を更新しました"
      redirect_to users_show_path(@user)
    else
      render "edit"
    end
  end

end
