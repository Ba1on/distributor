class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.float :hours
      t.integer :client_id
      t.integer :issue_id
      t.date :hours_date

      t.timestamps null: false
    end
  end
end
