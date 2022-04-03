class ProjectController < ApplicationController

  def create
    project = Project.create(project_params)
  end

  private
  def project_params
    params.permit(name:, manager:)
  end
end
