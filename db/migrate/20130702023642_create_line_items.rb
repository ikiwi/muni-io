class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :route_id
      t.integer :direction_id
      t.integer :stop_id

      t.timestamps
    end
  end
end
