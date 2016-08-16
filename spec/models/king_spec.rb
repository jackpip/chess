require 'rails_helper'

RSpec.describe King, type: :model do
  game = FactoryGirl.create(:game)
  king = FactoryGirl.create(:king, current_position_x: 0, current_position_y: 3, color: 'black', game: game)
  king2 = FactoryGirl.create(:king, current_position_x: 4, current_position_y: 4)
  describe 'valid_move?' do
    it 'should return false if move_to square is off board' do
      expect(king.valid_move?(9, 9)).to eq(false)
    end

    it 'should return false if move_to square is same square' do
      expect(king.valid_move?(0, 3)).to eq(false)
    end

    it 'should return false if move_to square contains piece with same color' do
      expect(king.valid_move?(0,0)).to eq(false)
    end

    it 'should return false when a move is out of range for King' do
      expect(king.valid_move?(0, 5)).to be(false)
    end

    it 'should return true when a move is in range for King' do
      expect(king2.valid_move?(4, 5)).to eq(true)
    end
  end

  castle_game = FactoryGirl.create(:game)
  king = Piece.find_by(current_position_x: 4, current_position_y: 0, game: castle_game)
  kingside_rook = Piece.find_by(current_position_x: 7, current_position_y: 0, game: castle_game)
  castle_game.pieces.find_by(current_position_x: 1, current_position_y: 0, game: castle_game).destroy()
  castle_game.pieces.find_by(current_position_x: 2, current_position_y: 0, game: castle_game).destroy()
  castle_game.pieces.find_by(current_position_x: 3, current_position_y: 0, game: castle_game).destroy()
  castle_game.pieces.find_by(current_position_x: 5, current_position_y: 0, game: castle_game).destroy()
  castle_game.pieces.find_by(current_position_x: 6, current_position_y: 0, game: castle_game).destroy()
  describe 'castling' do
    it 'should return true if castling is valid' do
      expect(king.castling?(6, 0)).to be(true)
    end
  end
end
