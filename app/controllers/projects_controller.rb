class ProjectsController < ApplicationController
  def index
    # 案件最新20件を取得
    projects = Project.order(created_at: :desc).limit(20)
    render json: { status: 200, projects: projects }
  end
end
