class King < Piece
  def valid_move?(move_to_x, move_to_y)

    # if this method is called from castling via obstructed
    # then it doesn't matter if range > 1
    if super == true && (proper_length?(move_to_x, move_to_y) || castling?(move_to_x, move_to_y))
      return true
    # elsif super == true && move_to_x == 1 || move_to_x == 6
    # return true
    else
      return false
    end
  end

  def proper_length?(move_to_x, move_to_y)
    x_diff = current_position_x - move_to_x
    y_diff = current_position_y - move_to_y

    (x_diff <= 1) && (y_diff <=1)
  end

  def castling?(x, y)
    # (self.current_position_x..x).each do |position|
    #   positions = pieces.where(current_position_x: position).to_a
    #   positions.each
    #   return false if game.check('black')
    # end

    # if king is currently in check, castling is false
    # if king would castle in to check, castling is false
    # if king hasn't moved and rook hasn't moved
    # if king would castle through check
    x_difference = current_position_x - x

    # Queenside
    if x < self.current_position_x
      queenside_rook = Piece.find_by(type: 'Rook', current_position_x: 0, current_position_y: y)
      if self.has_moved == false && queenside_rook.has_moved == false
        # is_obstructed? returns true, so !is_obstructed? will make castling? true
        # return !self.obstructed?(x, y)
        if x_difference.abs == 2 && y == current_position_y
          true
        else
          false
        end
      end
    end

    if x > self.current_position_x
      kingside_rook = Piece.find_by(type: 'Rook', current_position_x: 7, current_position_y: y)
      # if king hasn't moved and rook hasn't moved
      if self.has_moved == false && kingside_rook.has_moved == false
        # is_obstructed? returns true, so !is_obstructed? will make castling? true
        # return !self.obstructed?(x, y)
        if x_difference.abs == 2 && y == current_position_y
          true
        else
          false
        end
      end
    end
  end
end
