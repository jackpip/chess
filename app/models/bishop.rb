class Bishop < Piece
  def valid_move?(move_to_x, move_to_y)

    if is_obstructed?(move_to_x, move_to_y)
      return false
    elsif super == true && (current_position_x - move_to_x).abs == (current_position_y - move_to_y).abs 
      return true
    else
      return false
    end
  end
end
