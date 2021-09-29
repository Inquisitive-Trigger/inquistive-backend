class ApplicationCompanies::ProjectApprovalsController < ApplicationController
  def create
    application = ApplicationCompany.find(params[:application_company_id])
    application.status_project = "承認"
    if application.save! && @current_user.follow(application.user)
      render json: { status: 200, applicationCompany: application.to_hash }
    else
      render json: { status: 400, token: "Bad Request" }
    end
  end
end
