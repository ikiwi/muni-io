class RevertLineItems < ActiveRecord::Migration
  def change
  	rename_table :ib_line_items, :line_items
  end
end
