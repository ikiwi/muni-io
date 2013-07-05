class SplitLineItems < ActiveRecord::Migration
  def change
  	rename_table :Line_Items, :Line_Items_IB
  end
end
