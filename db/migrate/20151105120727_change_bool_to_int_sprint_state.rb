class ChangeBoolToIntSprintState < ActiveRecord::Migration
  def change
    change_column :sprints, :state, :integer, :default => 1
  end
end
