class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Success!!! my anal."
      redirect_to("/users/#{@user.id}")
    else
      flash[:danger] = " "          #if flash[:danger] をtrueにするため
      render 'static_pages/home'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email,
        :password, :password_confirmation)
    end
end
