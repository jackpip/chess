require 'rails_helper'

RSpec.describe Bishop, type: :model do
  game = FactoryGirl.create(:game)
  bishop = FactoryGirl.create(:bishop, current_position_x: 1, current_position_y: 4, color: 'black')
  bishop1 = FactoryGirl.create(:bishop, current_position_x: 1, current_position_y: 3, color: 'white')
  describe 'is_valid_move?' do
    it 'should return false if move_to square is off board' do
      expect(bishop.is_valid_move?(-1, -3)).to eq(false)
    end

    it 'should return false if move_to square is same square' do
      expect(bishop.is_valid_move?(1, 4)).to eq(false)
    end

    it 'should return false if move_to square contains piece with same color' do
      expect(bishop.is_valid_move?(1, 1)).to eq(false) 
    end

    it 'should return false when a move is out of range for Bishop' do
      expect(bishop.is_valid_move?(3, 5)).to be(false)
    end

    it 'should return true when a move is in range for Bishop' do
      expect(bishop.is_valid_move?(2, 3)).to be(true)
    end 

    it 'should return false if square is blocked' do
      expect(bishop1.is_valid_move?(4, 0)).to eq(false) 
    end
  end
end