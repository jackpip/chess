class Game < ActiveRecord::Base
  belongs_to :white_games, class_name: 'User', foreign_key: 'white_user_id'
  belongs_to :black_games, class_name: 'User', foreign_key: 'black_user_id'
  has_many :moves
  has_many :pieces

  def is_obstructed?(current_piece_id, x, y)
    piece = Piece.find(current_piece_id)
    current_x = piece.current_position_x
    current_y = piece.current_position_y
    x_difference = current_x - x
    y_difference = current_y - y
    all_pieces = self.pieces

    if (x_difference.abs != y_difference.abs) && (x_difference != 0) && (y_difference != 0)
      puts "Invalid input"
      #flash.now[:alert] = 'Invalid input'
      return
    end

    check = false
    new_x = x
    new_y = y

    while !check
      # starting from the destination, moves through 
      # each square in between the destination and current

      if new_x > current_x
        new_x = new_x - 1
      elsif new_x < current_x
        new_x = new_x + 1
      end

      if new_y > current_y
        new_y = new_y - 1
      elsif new_y < current_y
        new_y = new_y + 1
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

    return false

  end
end
