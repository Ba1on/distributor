class IssuesController < ApplicationController
  before_action :current_sprint

  def index
    @issues = Issue.all
    @est_time = estimated_hours_to_sprint
  end

  def update
    begin
      @issue = Issue.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    end
    @issue.update(sprint_id: params[:sprint_id])
    redirect_to issues_path
  end

  private

  def current_sprint
    @sprint = Sprint.where(state: true).first
    unless @sprint
      flash[:notice] = t('.opened_sprint_not_found')
      redirect_to sprints_path
    end
  end

  def estimated_hours_to_sprint
    Issue.where(sprint_id: @sprint.id).sum(:estimated_hours)
  end
end
