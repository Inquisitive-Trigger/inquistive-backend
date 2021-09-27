class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  
  before_action :authenticate

  def index
    render json: { status: 200, message: "Hello, we are inquisitive!!" }
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by(token: token)
      @current_user.present?
    end
  end
end
