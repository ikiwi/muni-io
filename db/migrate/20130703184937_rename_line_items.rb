class RenameLineItems < ActiveRecord::Migration
  def change
  	rename_table :Line_Items_IB, :ib_line_items
  end
end
