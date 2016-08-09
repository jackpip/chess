class AddDefaultValueToHasMoved < ActiveRecord::Migration
  def change
    change_column :pieces, :has_moved, :boolean, :default => false
  end
end
