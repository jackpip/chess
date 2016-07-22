class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :turn
      t.integer :position_x
      t.integer :position_y
      t.integer :game_id
      t.integer :piece_id
      t.integer :user_id 
      
      t.timestamps
    end
  end
end
