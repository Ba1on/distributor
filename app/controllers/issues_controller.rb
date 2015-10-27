class IssuesController < ApplicationController
  before_filter :current_sprint
  before_filter :that_issue, only: [:update, :add_issue, :remove_issue]

  def index
    @issues = Issue.all
  end

  def update
    if @issue
      flash[:notice] = t('.issue_can_not_be_updated') unless
        @issue.update(sprint_id: params[:sprint_id])
    else
      flash[:notice] = t('.issue_is_not_found')
    end
    redirect_to issues_path
  end

  private

  def current_sprint
    @sprint = Sprint.where(state: true).first
    return redirect_to sprints_path unless @sprint
  end

  def that_issue
    @issue = Issue.where(id: params[:id]).first
  end
end
