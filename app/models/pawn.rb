class Pawn < Piece
  def valid_move?(move_to_x, move_to_y)
    return false if (current_position_x - move_to_x).abs != 0 
    if has_moved == true
      if color == 'white' && (current_position_y - move_to_y) == 1 
        return true
      elsif 
        color == 'black' && (current_position_y - move_to_y) == -1
        return true
      else
        return false
      end
    else
      if color == 'white' && (1..2) === (current_position_y - move_to_y)
        return true
      elsif 
        color == 'black' && (current_position_y - move_to_y) == -1 || (current_position_y - move_to_y) == -2
        return true
      else
        return false
      end      
    end
  end
end
