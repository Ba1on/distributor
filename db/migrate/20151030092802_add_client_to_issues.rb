class AddClientToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :client_id, :integer
  end
end
