class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :start_position_x
      t.integer :start_position_y
      t.integer :color
      t.string :type

      t.timestamps
    end
  end
end
