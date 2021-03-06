class Queen < Piece
  def valid_move?(position_x, position_y)
    if obstructed?(position_x, position_y)
      return false
    else
      super == true &&
      (# vertical
      current_position_x == position_x ||
      # horizontal
      current_position_y == position_y ||
      # diagonal
      (current_position_y - position_y).abs == (current_position_x - position_x).abs)
    end
  end
end
