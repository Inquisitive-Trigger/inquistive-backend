class ApplicationCompanies::ProjectDenialsController < ApplicationController
  def create
    application = ApplicationCompany.find(params[:application_company_id])
    application.status_project = "拒否"
    if application.save!
      render json: { status: 200, applicationCompany: application }
    else
      render json: { status: 400, token: "Bad Request" }
    end
  end
end