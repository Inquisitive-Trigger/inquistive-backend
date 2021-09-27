class ProjectsController < ApplicationController
  def index
    # 案件最新20件を取得
    projects = Project.order(created_at: :desc).limit(20)
    render json: { status: 200, projects: projects }
  end

  def show
    project = Project.find(params[:id])
    render json: { status: 200, project: project }
  end

  def search
    projects = Project.where(category: params[:category]).limit(20)
    render json: { status: 200, projects: projects }
  end

  def create
    project = Project.new(
      name: params[:name],
      status: "受付中",
      concept: params[:concept],
      deadline: DateTime.parse(params[:deadline]),
      reward: params[:reward].to_i,
      category: params[:category]
    )

    project.user = @current_user
    if project.save!
      render json: { status: 201, project: project }
    else
      render json: { status: 400, message: "Bad Request" }
    end
  end

  def update
    project = Project.find([params[:id]])[0]
    project.assign_attributes(
      name: params[:name],
      concept: params[:concept],
      deadline: DateTime.parse(params[:deadline]),
      reward: params[:reward].to_i,
      category: params[:category]
    )
    if project.save!
      render json: { status: 200, project: project }
    else
      render json: { status: 400, message: "Bad Request" }
    end
  end
end
