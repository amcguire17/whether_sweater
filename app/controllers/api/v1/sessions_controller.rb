class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      render json: UsersSerializer.new(user)
    else
      render json: { message: "Something is wrong. Please try again." }, status: :bad_request
    end
  end
end
