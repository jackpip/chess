class RemoveDetailsFromMoves < ActiveRecord::Migration
  def change
    remove_column :moves, :position_x, :integer
    remove_column :moves, :position_y, :integer
  end
end
