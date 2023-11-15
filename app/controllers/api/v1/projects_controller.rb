require "rails_helper"

class Api::V1::ProjectsController < ApplicationController

  before_action :set_project, only: %i[show] #show update destroy

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: @project
  end

private

def set_project
  @project = Project.find(params[:id])
end

def project_params
  params.require(:project).permit(:name, :tool)
end

end
