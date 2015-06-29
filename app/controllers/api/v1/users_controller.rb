class Api::V1::UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user.decorate.user_info
  end

  def create
    user = User.new(users_params)

    if user.save
      render json: user
    else
      render json: { errors: user.errors }
    end
  end

  private
  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
