class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :s_id
      t.string :s_desc

      t.timestamps
    end
  end
end
