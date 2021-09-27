class SessionController < ApplicationController
  def create
    user = User.find_by(name: params[:name], password: params[:password])
    if user.present?
      render json: { status: 201, token: user.token }
    else 
      render json: { status: 403, token: "Sign in failed" }
    end
  end
end
