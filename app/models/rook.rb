class Rook < Piece

  def valid_move?(destination_x, destination_y)
    #return false if self.obstructed?(destination_x, destination_y) != false
    return super && current_position_x == destination_x || current_position_y == destination_y
  end

end
