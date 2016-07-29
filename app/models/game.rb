class Game < ActiveRecord::Base
  belongs_to :white_games, class_name: 'User', foreign_key: 'white_user_id'
  belongs_to :black_games, class_name: 'User', foreign_key: 'black_user_id'
  has_many :moves
  has_many :pieces
end
