class ClientsController < ApplicationController
  def create
    @client = Client.first_or_create(name: params[:client])
  end
end
