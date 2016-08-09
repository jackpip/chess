class King < Piece
  def is_valid_move?(move_to_x, move_to_y)

    if super == true && (current_position_x - move_to_x).abs <= 1 && (current_position_y - move_to_y).abs <= 1
      return true
    else
      return false
    end

  end

  def castling?(x, y)
    if x < self.current_position_x
      queenside_rook = Piece.find_by(current_position_x: 0, current_position_y: y)
      # if king hasn't moved and rook hasn't moved
      if self.has_moved == false && queenside_rook.has_moved == false
        # is_obstructed? returns true, so !is_obstructed? will make castling? true
        return !self.is_obstructed?(x, y)
      end
    end

    if x > self.current_position_x
      kingside_rook = Piece.find_by(current_position_x: 7, current_position_y: y)
      # if king hasn't moved and rook hasn't moved
      if self.has_moved == false && kingside_rook.has_moved == false
        # is_obstructed? returns true, so !is_obstructed? will make castling? true
        return !self.is_obstructed?(x, y)
      end
    end
  end
end
