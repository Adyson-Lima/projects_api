class Api::V1::ProjectsController < ApplicationController

  before_action :set_project, only: %i[show update destroy] #show update destroy

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created, location: api_v1_project_url(@project)
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy!
  end

private

def set_project
  @project = Project.find(params[:id])
end

def project_params
  params.require(:project).permit(:name, :tool)
end

end
