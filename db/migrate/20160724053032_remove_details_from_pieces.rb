class RemoveDetailsFromPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :start_position_x, :integer
    remove_column :pieces, :start_position_y, :integer
  end
end
