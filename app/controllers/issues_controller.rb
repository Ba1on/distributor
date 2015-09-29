class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # на человека по 40 часов в неделю
  def index
    @issues = Issue.all
        
    unless params[:client] == nil
      @total_time = params[:client].size*40
    else 
      @total_time = 0
    end
 
    @current_sprint = current_sprint.id

    #@clients = Client.where.not(id: params[:client])
    @clients = Client.select{|client| log.exclude?(client[:id])}
    #Rails.logger.info "=============================== #{log}"
    Sprint.find(session[:sprint_id]).clients << Client.find(params[:client])
    flash[:notice] = 'Event was saved.'
  end

  def create
  end 

  private
  def all_clients
    Client.all.map{|repos| repos[:id]}
  end

  def adding_client
    params[:client].map{ |i| i.to_i }
  end

  def log
    SprintClient.all.map{|repos| repos[:client_id]}
  end

end
