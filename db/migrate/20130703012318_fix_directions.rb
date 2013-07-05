class FixDirections < ActiveRecord::Migration
  def change
  	remove_column :directions, :d_id
  	remove_column :directions, :d_desc
  	add_column :directions, :r_id, :string
  	add_column :directions, :ib_id, :string
  	add_column :directions, :ib_desc, :string
  	add_column :directions, :ob_id, :string
  	add_column :directions, :ob_desc, :string
  end
end
