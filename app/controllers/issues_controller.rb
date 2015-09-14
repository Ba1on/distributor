class IssuesController < ApplicationController

  def index
    @issues = Issue.all
    @sprint = Sprint.where(state: true).first
  end

end
