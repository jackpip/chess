require 'rails_helper'

RSpec.describe Piece, type: :model do
  game = FactoryGirl.create(:game)
  piece_1 = FactoryGirl.create(:piece, current_position_x: 0, current_position_y: 0)
  piece_2 = FactoryGirl.create(:piece, current_position_x: 0, current_position_y: 1)
  piece_3 = FactoryGirl.create(:piece, current_position_x: 0, current_position_y: 0, color: 'black')
  piece_4 = FactoryGirl.create(:piece, current_position_x: 0, current_position_y: 7)
  piece_5 = FactoryGirl.create(:piece, current_position_x: 0, current_position_y: 6)
  piece_6 = FactoryGirl.create(:piece, current_position_x: 7, current_position_y: 5)
  describe 'obstructed?' do
    context 'when there is an obstruction' do
      it 'should return true' do
        # black pieces
        expect(piece_1.obstructed?(0, 2)).to eq(true)
        expect(piece_1.obstructed?(0, 3)).to eq(true)
        expect(piece_1.obstructed?(2, 0)).to eq(true)
        expect(piece_2.obstructed?(2, 1)).to eq(true)
        expect(piece_1.obstructed?(3, 3)).to eq(true)
        # white pieces
        expect(piece_4.obstructed?(0, 5)).to eq(true)
        expect(piece_4.obstructed?(2, 7)).to eq(true)
      end
    end

    context 'when there is not an obstruction' do
      it 'should return false' do
        # black pieces
        expect(piece_2.obstructed?(0, 3)).to eq(false)
        expect(piece_2.obstructed?(2, 3)).to eq(false)
        expect(piece_2.obstructed?(4, 5)).to eq(false)
        # white pieces
        expect(piece_5.obstructed?(0, 4)).to eq(false)
        expect(piece_6.obstructed?(5, 5)).to eq(false)
      end
    end
  end
  # describe '.is_obstructed?' do
  #   it 'should return nil on invalid input' do
  #     expect(piece_1.is_obstructed?(8, 8)).to eq(nil)
  #   end
  #
  #   it 'should return true on obstruction' do
  #     expect(piece_1.is_obstructed?(5, 7)).to eq(true)
  #   end
  #
  #   it 'should return false on no obstruction' do
  #     expect(piece_1.is_obstructed?(4, 6)).to eq(false)
  #   end
  # end

  describe 'is_valid_move?' do
    it 'should return false if move_to square is off board' do
      expect(piece_1.is_valid_move?(9, 9)).to eq(false)
    end

    it 'should return false if move_to square is same square' do
      expect(piece_2.is_valid_move?(6, 5)).to eq(false)
    end

    it 'should return false if move_to square contains piece with same color' do
      expect(piece_3.is_valid_move?(0, 0)).to eq(false)
    end

    it 'should return true if move_to square is on board, is a different square and does not contain piece with same color' do
      expect(piece_3.is_valid_move?(3, 3)).to eq(true)
    end
  end

  describe 'move_to!' do
    it 'shoould update has_moved attribute to true' do
      piece_2.move_to!(3, 4)
      expect(piece_2.has_moved).to eq(true)
    end
  end

end
