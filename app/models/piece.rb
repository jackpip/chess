class Piece < ActiveRecord::Base
  belongs_to :game
  has_many :moves

  def symbol
    "#{color}-#{type.downcase}.png"
  end
end
