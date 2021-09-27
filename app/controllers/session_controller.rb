class SessionController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_by(email: params[:email], password: params[:password])
    if user.present?
      render json: { status: 201, token: user.token }
    else 
      render json: { status: 403, token: "Sign in failed" }
    end
  end
end
