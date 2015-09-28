class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]

  def index
    @sprints = Sprint.all
  end

  def show
  end

  def new
  	@sprint = Sprint.new
  end

  def edit
  end

  def create
  	@sprint = Sprint.new(sprint_params)

  	respond_to do |format|
      if @sprint.save
        format.html { redirect_to @sprint, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to @sprint, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end  	
  end

  def destroy
  	@sprint.destroy
    respond_to do |format|
      format.html { redirect_to sprint_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_sprint
    @sprint = Sprint.find(params[:id])
  end

  def sprint_params
	 params.require(:sprint).permit(:name, :state) 	  	
  end
end
