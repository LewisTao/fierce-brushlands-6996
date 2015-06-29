class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_with_token!, only: [:destroy]

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = User.find_by(email: user_email)

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user
    else
      render json: { errors: 'Invalid email or password' }
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
end
