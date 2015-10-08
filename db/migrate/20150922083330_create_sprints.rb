class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :name
      t.boolean :state, :default => true

      t.timestamps null: false
    end
  end
end
