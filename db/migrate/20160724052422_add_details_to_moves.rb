class AddDetailsToMoves < ActiveRecord::Migration
  def change
    add_column :moves, :start_position_x, :integer
    add_column :moves, :start_position_y, :integer
    add_column :moves, :end_position_x, :integer
    add_column :moves, :end_position_y, :integer
  end
end
