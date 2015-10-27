class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy, :close]
  before_action :all_clients, only: [:new, :edit, :create, :update]
  before_filter :collect_selected_clients, only: [:create, :edit, :update]

  def index
    @sprints = Sprint.all
  end

  def new
    @sprint = Sprint.new
  end

  def create
    @sprint = Sprint.new(sprint_params)
    if @sprint.save
      clients_work_hours
      return redirect_to sprints_url
    end
    render :new
  end

  def update
    if @sprint.update(sprint_params)
      clients_work_hours
      return redirect_to @sprint
    end
    render :edit
  end

  def destroy
    return redirect_to sprints_url if @sprint.destroy
  end

  def close
    @sprint.update(state: false)? flash[:notice] = t(:sprint_was_closed) : flash[:notice] = t(:sprint_cannot_close)
    redirect_to issues_path
  end

  private

  def set_sprint
    @sprint = Sprint.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to sprint_url, notice: t('.sprint_not_found')
  end

  def sprint_params
    params.require(:sprint).permit(:name, :state, :work_hours, client_ids: [])
  end

  def collect_selected_clients
    @collect_selected = (@sprint.present? && @sprint.clients.any?) ? @sprint.clients.map(&:id) : []
  end

  def all_clients
    @clients = Client.all
  end

  def clients_work_hours
    @sprint.update_attributes(work_hours: @sprint.clients.count * 40)
  end
end
