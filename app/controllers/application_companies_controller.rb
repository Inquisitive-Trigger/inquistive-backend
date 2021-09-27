class ApplicationCompaniesController < ApplicationController
  before_action :introducer_authenticate

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
end
