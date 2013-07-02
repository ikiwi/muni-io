class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :r_id
      t.string :r_desc

      t.timestamps
    end
  end
end
