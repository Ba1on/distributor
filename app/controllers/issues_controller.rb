class IssuesController < ApplicationController
  before_filter :current_sprint

  def index
    @issues = Issue.all
  end

  def update
    @issue = Issue.where(id: params[:id]).first
    flash[:notice] = t('.issue_is_not_found') unless @issue
    flash[:notice] = t('.issue_can_not_be_updated') unless
      @issue.update_attributes(sprint_id: params[:sprint_id])
    redirect_to issues_path
  end

  private

  def current_sprint
    @sprint = Sprint.where(state: true).first
    return redirect_to sprints_path, flash[:notice] =
      t('.opened_sprint_not_found') unless @sprint
  end
end
