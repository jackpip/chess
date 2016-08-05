class Rook < Piece

  def valid_move?(destination_x, destination_y)
    return false if self.is_obstructed?(destination_x, destination_y) != false
    return current_position_x == destination_x || current_position_y == destination_y
  end

end
