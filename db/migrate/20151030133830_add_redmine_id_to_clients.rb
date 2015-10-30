class AddRedmineIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :redmine_id, :integer
  end
end
