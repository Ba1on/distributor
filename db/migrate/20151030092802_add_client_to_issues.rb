class AddClientToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :redmine_user_id, :integer
  end
end
