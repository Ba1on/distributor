class CreateSprintClients < ActiveRecord::Migration
  def change
    create_table :sprint_clients do |t|
      t.integer :client_id, index: true
      t.integer :sprint_id, index: true

      t.timestamps null: false
    end
  end
end
