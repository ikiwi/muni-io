class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.string :d_id
      t.string :string
      t.string :d_desc

      t.timestamps
    end
  end
end
