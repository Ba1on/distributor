class AddTimeToSprints < ActiveRecord::Migration
  def change
    add_column :sprints, :work_hours, :integer
  end
end
