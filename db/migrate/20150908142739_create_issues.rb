class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.float :estimated_hours
      t.float :hours
      t.string :status
      t.string :subject
      t.integer :sprint_id

      t.timestamps null: false
    end
  end
end
