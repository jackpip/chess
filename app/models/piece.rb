class Piece < ActiveRecord::Base
  belongs_to :game
  has_many :moves

  def is_valid_move?(move_to_x, move_to_y)
    move_to_piece = Piece.find_by(current_position_x: move_to_x, current_position_y: move_to_y)
    #check move is on the board
    if move_to_x < 0 || move_to_x > 7 || move_to_y < 0 || move_to_y > 7
      return false
    #check move is not to the same square
    elsif current_position_x == move_to_x && current_position_y == move_to_y
      return false
    #check move is not to square that contains player's own piece
    elsif move_to_piece.present? && self.color == move_to_piece.color
      return false
    else
      return true
    end
  end

  # Possibly needs refactoring - shares common code with is_valid_move
  def move_to!(new_x, new_y)
    piece = self
    # variable to see if space is occupied
    is_space_occupied = Piece.find_by(current_position_x: new_x, current_position_y: new_y)

    # if space is occupied and it's a different color
    if is_space_occupied && is_space_occupied.color != piece.color
      is_space_occupied.destroy()
      piece.update_attributes(current_position_x: new_x, current_position_y: new_y, has_moved: true)
    # added in logic to check if square is empty
    elsif !is_space_occupied
      piece.update_attributes(current_position_x: new_x, current_position_y: new_y, has_moved: true)
    else
      puts "Error, You can't capture your own piece."
    end
  end


  def symbol
    "#{color}-#{type.downcase}.png"
  end

  def is_obstructed?(x, y)
    piece = self
    current_x = piece.current_position_x
    current_y = piece.current_position_y
    x_difference = current_x - x
    y_difference = current_y - y
    all_pieces = Game.find(game_id).pieces

    if (x_difference.abs != y_difference.abs) && (x_difference != 0) && (y_difference != 0)
      # puts "Invalid input"
      # flash.now[:alert] = 'Invalid input'
      return
    end

    check = false
    new_x = x
    new_y = y

    while !check
      # starting from the destination, moves through
      # each square in between the destination and current

      if new_x > current_x
        new_x -= 1
      elsif new_x < current_x
        new_x += 1
      end

      if new_y > current_y
        new_y -= 1
      elsif new_y < current_y
        new_y += 1
      end

      # if at current position stop looping
      if (new_x == current_x) && (new_y == current_y)
        check = true
      # else, check position of each piece on the board
      # to see if it is obstructing
      else
        all_pieces.each do |p|
          if (p.current_position_x == new_x) && (p.current_position_y == new_y)
            return true
          end
        end
      end

    end

    false
  end

  def obstructed?(move_to_x, move_to_y)
    unless is_valid_move?(move_to_x, move_to_y)
      return "This is not a valid move"
    end
    # we need to know the squares in between
    # (self.current_position_x,self.current_position_y) - (move_to_x, move_to_y)
    # (0, 0) - (0, 2) so squares in between = (0, 1)

    # (0, 1) - (0, 3) so squares in between = (0, 2)

    # (0, 0) - (0, 3) squares in between = (0, 1), (0, 2)

    # (0, 0) - (2, 0) squares between = (1, 0)

    difference_x = (move_to_x - self.current_position_x).abs
    difference_y = (move_to_y - self.current_position_y) # .abs
    count = 1

    # (0, 6) - (0, 4) spaces between = (0, 5)
    # move_to_y = 4, self.current_position_y = 6, difference_y = -2

    # vertical
    if difference_x == 0
      while count < difference_y.abs
        if difference_y < 0
          piece = Piece.find_by(current_position_x: 0, current_position_y: move_to_y + count)
        else
          piece = Piece.find_by(current_position_x: 0, current_position_y: move_to_y - count)
          if piece.present?
            return true
          else
            count += 1
          end
        end
        false
      end
    end

    # horizontal
    if difference_y == 0
      while count < difference_x
        piece = Piece.find_by(current_position_x: move_to_x - count, current_position_y: 0)
        if piece.present?
          return true
        else
          count += 1
        end
        false
      end
    end

    # (0, 0) - (2, 2) squares in between = (1, 1)

    # (0, 1) - (2, 3) squares in between = (1, 2)

    # (0, 0) - (3, 3) squares between = (1, 1), (2, 2)

    # diagonal

    if difference_x == difference_y
      while count < difference_x
        piece = Piece.find_by(current_position_x: move_to_x - count, current_position_y: move_to_y - count)
        if piece.present?
          return true
        else
          count += 1
          false
        end
      end
    end



    # while count < difference_x || count < difference_y
    #   piece = Piece.find_by(current_position_x: move_to_x - count, current_position_y: move_to_y - count) # (0, 2 - 1) = (0, 1)
    #   if piece.present?
    #     return true
    #   else
    #     count += 1
    #   end
    #   false
    # end

    # if Piece.where(current_position_x: 0, current_position_y: move_to_y - 2).present?
    #   return true
    # end

    false
  end
end
