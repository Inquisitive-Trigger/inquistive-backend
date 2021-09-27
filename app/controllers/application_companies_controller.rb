class ApplicationCompaniesController < ApplicationController
  before_action :introducer_authenticate, only: [:create, :update, :destroy]
  before_action :mine?, only: [:update, :destroy]

  def show
    application = ApplicationCompany.find(params[:id])
    render json: { status: 200, applicationCompany: application }
  end

  def create
    application = ApplicationCompany.new(
      name: params[:name],
      detail: params[:detail],
      reason: params[:reason],
      contact_name: params[:contactName],
      contact_email: params[:contactEmail],
      phone_number: params[:phoneNumber],
      status_worker: "返答待ち",
      status_project: "返答待ち"
    )
    application.user = @current_user
    application.project = Project.find(params[:projectId])
    if application.save!
      render json: { status: 201, applicationCompany: application }
    else
      render json: { status: 400, token: "Bad Request" }
    end
  end

  def update
    application = ApplicationCompany.find(params[:id])
    application.assign_attributes(
      name: params[:name],
      detail: params[:detail],
      reason: params[:reason],
      contact_name: params[:contactName],
      contact_email: params[:contactEmail],
      phone_number: params[:phoneNumber],
    )

    if application.save!
      render json: { status: 200, applicationCompany: application }
    else
      render json: { status: 400, token: "Bad Request" }
    end
  end

  def destroy
    application = ApplicationCompany.find(params[:id])
    if application.destroy!
      render json: { status: 204, message: "Success" }
    else
      render json: { status: 400, message: "Bad Request" }
    end
  end

  private 
  
  def mine?
    authenticate_or_request_with_http_token do |token, options|
      application = ApplicationCompany.find(params[:id])
      @current_user.id == application.user.id
    end
  end
end
