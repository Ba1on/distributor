class CreateSprintUsers < ActiveRecord::Migration
  def change
    create_table :sprint_users do |t|
    	t.integer :sprint_id
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
