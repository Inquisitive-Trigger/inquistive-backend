class ProjectsController < ApplicationController
  before_action :mine?, only: [:update, :destroy]

  skip_before_action :authenticate, only: [:index, :show, :search]

  def index
    token = request.headers[:authorization]&.delete_prefix("Token ")
    current_user = User.find_by(token: token)
    if current_user.present? && current_user.searcher?
      # ユーザーが投稿した案件を取得
      raw_projects = current_user.projects
      projects = raw_projects.map(&:to_hash)
      render json: { status: 200, projects: projects }
    else
      # 案件最新20件を取得
      raw_projects = Project.order(created_at: :desc).limit(20)
      projects = raw_projects.map(&:to_hash)
      render json: { status: 200, projects: projects }
    end
  end

  def show
    project = Project.find(params[:id]).to_hash
    render json: { status: 200, project: project }
  end

  def search
    raw_projects = Project.where(category: params[:category]).limit(20)
    projects = raw_projects.map(&:to_hash)
    render json: { status: 200, projects: projects }
  end

  def create
    project = Project.new(
      name: params[:name],
      status: "受付中",
      concept: params[:concept],
      appeal: params[:appeal],
      wish_person: params[:wish_person],
      deadline: DateTime.parse(params[:deadline]),
      reward: params[:reward].to_i,
      company_info: params[:company_info],
      company_url: params[:company_url],
      category: params[:category]
    )

    project.user = @current_user
    if project.save!
      render json: { status: 201, project: project.to_hash }
    else
      render json: { status: 400, message: "Bad Request" }
    end
  end

  def update
    project = Project.find(params[:id])
    project.assign_attributes(
      name: params[:name],
      concept: params[:concept],
      appeal: params[:appeal],
      wish_person: params[:wish_person],
      deadline: DateTime.parse(params[:deadline]),
      reward: params[:reward].to_i,
      company_info: params[:company_info],
      company_url: params[:company_url],
      category: params[:category]
    )
    if project.save!
      render json: { status: 200, project: project.to_hash }
    else
      render json: { status: 400, message: "Bad Request" }
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.destroy!
      render json: { status: 204, message: "Success" }
    else
      render json: { status: 400, message: "Bad Request" }
    end
  end

  private
  
  def mine?
    project = Project.find(params[:id])
    unless project.user.id == @current_user.id
      redirect_to "/"
    end
  end
end
