class IssuesController < ApplicationController
  before_action :current_sprint

  def index
    @issues = Issue.all
    @est_time = estimated_hours_to_sprint
  end

  def update
    if @issue = Issue.find(params[:id])
      # подозреваю, что так не стоит делать. зато работает)
      @issue.update(sprint_id: params[:sprint_id])
      redirect_to issues_path
    end
  end

  private

  def current_sprint
    @sprint = Sprint.where(state: true).first!
    rescue Exception => e
      redirect_to sprints_path, notice: t('.opened_sprint_not_found')
  end

  def estimated_hours_to_sprint
    Issue.where(sprint_id: @sprint.id).map{|x| x.estimated_hours}.sum
  end

end
