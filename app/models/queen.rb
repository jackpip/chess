class Queen < Piece
  def valid_move? (position_x, position_y)
    if position_x < 0 || position_x > 7 || position_y < 0 || position_y > 7
      return false
    elsif ( is_obstructed?(position_x, position_y))
      return false
    end
      return true
    end
end
