class UsersController < ApplicationController
  def index
    @total_clients = Client.count
  end
end
