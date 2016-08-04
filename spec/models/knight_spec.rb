require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe 'valid_move?' do
    it 'should return true when a move is valid' do
      game = Game.create(name: 'Test Game', white_user_id: 1, black_user_id: 2, winning_user_id: nil)
      knight = Piece.create(color: 'Black', type: 'Knight', current_position_x: 4, current_position_y: 4, game_id: game.id)

      expect(knight.valid_move?(6, 5)).to be(true)
      expect(knight.valid_move?(5, 6)).to be(true)
      expect(knight.valid_move?(2, 3)).to be(true)
      expect(knight.valid_move?(2, 5)).to be(true)
    end

    it 'should return false when a move is not valid' do
      game = Game.create(name: 'Test Game', white_user_id: 1, black_user_id: 2, winning_user_id: nil)
      knight = Piece.create(color: 'Black', type: 'Knight', current_position_x: 4, current_position_y: 4, game_id: game.id)

      expect(knight.valid_move?(5, 5)).to be(false) # diagonal move
      expect(knight.valid_move?(4, 6)).to be(false) # vertical move
      expect(knight.valid_move?(5, 4)).to be(false) # horizontal move
      expect(knight.valid_move?(7, 4)).to be(false)
      expect(knight.valid_move?(4, 7)).to be(false) 
    end
  end
end
