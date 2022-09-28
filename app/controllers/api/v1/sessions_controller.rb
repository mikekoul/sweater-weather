class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: SessionSerializer.new(user).response, status: 200
    else
      render json: { data: { message: 'Invalid Credentials' } }, status: 400
    end
  end

  private
    def user_params
      params.permit(:email, :password)
    end
end