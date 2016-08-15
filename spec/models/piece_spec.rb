require 'rails_helper'

RSpec.describe Piece, type: :model do
  game = FactoryGirl.create(:game)
  piece_1 = FactoryGirl.create(:piece)
  piece_2 = FactoryGirl.create(:piece, current_position_x: 6, current_position_y: 5)
  piece_3 = FactoryGirl.create(:piece, current_position_x: 0, current_position_y: 3, color: 'black')
  describe '.is_obstructed?' do
    it 'should return nil on invalid input' do
      expect(piece_1.is_obstructed?(8, 8)).to eq(nil)
    end

    it 'should return true on obstruction' do
      expect(piece_1.is_obstructed?(5, 7)).to eq(true)
    end

    it 'should return false on no obstruction' do
      expect(piece_1.is_obstructed?(4, 6)).to eq(false)
    end
  end

  describe 'valid_move?' do
    it 'should return false if move_to square is off board' do
      expect(piece_1.valid_move?(9, 9)).to eq(false)
    end

    it 'should return false if move_to square is same square' do
      expect(piece_2.valid_move?(6, 5)).to eq(false)
    end

    it 'should return false if move_to square contains piece with same color' do
      expect(piece_3.valid_move?(0, 0)).to eq(false) 
    end

    it 'should return true if move_to square is on board, is a different square and does not contain piece with same color' do
      expect(piece_3.valid_move?(3, 3)).to eq(true)
    end
  end

  describe 'move_to!' do
    it 'shoould update has_moved attribute to true' do
      piece_2.move_to!(3, 4)
      expect(piece_2.has_moved).to eq(true)
    end
  end

end
