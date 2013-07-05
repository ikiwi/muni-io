class CreateObLineItems < ActiveRecord::Migration
  def change
    create_table :ob_line_items do |t|
      t.string :route_id
      t.string :direction_id
      t.string :stop_id

      t.timestamps
    end
  end
end
