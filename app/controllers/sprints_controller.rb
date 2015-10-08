class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]
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
    return redirect_to sprints_url if @sprint.save
    render :new
  end

  def update
    return redirect_to @sprint if @sprint.update(sprint_params)
    render :edit
  end

  def destroy
    return redirect_to sprints_url if @sprint.destroy
  end

  private

  def set_sprint
    @sprint = Sprint.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to sprint_url, notice: t('.sprint_not_found')
  end

  def sprint_params
   params.require(:sprint).permit(:name, :state, client_ids:[])
  end

  def collect_selected_clients
    @collect_selected = (@sprint.present? && @sprint.clients.any?) ? @sprint.clients.map(&:id) : []
  end

  def all_clients
    @clients = Client.all
  end
end
