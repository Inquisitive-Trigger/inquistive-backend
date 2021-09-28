class UserController < ApplicationController
  skip_before_action :authenticate, only: :create

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      purpose: params[:type]
    )
    if user.save!
      render json: { status: 201, user: user }
    else
      render json: { status: 400, token: "Bad Request" }
    end
  end
end
