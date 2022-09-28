class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password_confirmation], api_key: SecureRandom.hex)
    if user_params[:password] != user_params[:password_confirmation]
    render json: { data: { message: 'Passwords do not match' } }, status: 400
    elsif user.save
      render json: UserSerializer.new(user).response, status: 201
    end
  end
  
  private
  def user_params
      params.permit(:email, :password, :password_confirmation)
  end
end