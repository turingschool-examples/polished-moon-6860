class ProjectssController < ApplicationController
  def show
    @project = project.find(params[:id])
  end