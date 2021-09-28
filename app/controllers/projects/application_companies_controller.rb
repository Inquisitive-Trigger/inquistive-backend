class Projects::ApplicationCompaniesController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    application_companies = project.application_companies.map(&:to_hash)
    render json: { status: 200, applicationCompanies: application_companies }
  end
end
