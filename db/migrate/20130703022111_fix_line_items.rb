class FixLineItems < ActiveRecord::Migration
  def change
  	remove_column :line_items, :route_id
  	remove_column :line_items, :direction_id
  	remove_column :line_items, :stop_id
  	add_column :line_items, :route_id, :string
  	add_column :line_items, :direction_id, :string
  	add_column :line_items, :stop_id, :string
  end
end
