class UserController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      purpose: params[:type] == "true"
    )
    if user.save!
      render json: { status: 201, token: user.token }
    else
      render json: { status: 400, token: "Bad Request" }
    end
  end
end
