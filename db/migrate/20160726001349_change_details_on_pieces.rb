class ChangeDetailsOnPieces < ActiveRecord::Migration
  def change
    change_column :pieces, :color, :string
  end
end
