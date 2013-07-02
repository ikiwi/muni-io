class FixColumns < ActiveRecord::Migration
  def change
  	remove_column :directions, :string
  end
end
