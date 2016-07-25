class AddDetailsToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :current_position_x, :integer
    add_column :pieces, :current_position_y, :integer
    add_column :pieces, :game_id, :integer
  end
end
