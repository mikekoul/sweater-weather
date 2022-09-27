class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(email: user_params[:email], password: user_params[:password], password_confirmation: user_params['password_confirmation'], api_key: SecureRandom.hex)
    if user.save
      render json: UserSerialzer.new(user), status: 201
    else
      render json: { data: {} }, status: 400
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end