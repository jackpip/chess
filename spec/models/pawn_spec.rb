require 'rails_helper'

RSpec.describe Pawn, type: :model do
  game = Game.create(name: 'Divergence', white_user_id: 1, black_user_id: 2, winning_user_id: nil)
  white_pawn = Piece.create(color: 'white', type: 'Pawn', current_position_x: 4, current_position_y: 6, game_id: game.id, has_moved: false)
  black_pawn = Piece.create(color: 'black', type: 'Pawn', current_position_x: 4, current_position_y: 1, game_id: game.id, has_moved: false)
  white_pawn_2 = Piece.create(color: 'white', type: 'Pawn', current_position_x: 4, current_position_y: 6, game_id: game.id, has_moved: true)
  black_pawn_2 = Piece.create(color: 'black', type: 'Pawn', current_position_x: 4, current_position_y: 1, game_id: game.id, has_moved: true)
  
  describe 'valid_move?' do

    # Returns false if the pawn moves left or right
    it 'should return false if the pawn moves left or right' do      
      expect(white_pawn.valid_move?(3, 6)).to be(false)  
      expect(white_pawn.valid_move?(5, 6)).to be(false)
      expect(black_pawn.valid_move?(3, 1)).to be(false) 
      expect(black_pawn.valid_move?(5, 1)).to be(false)       
    end

    # Testing for the first move
    it 'should return true when a white pawn first move is valid' do      
      expect(white_pawn.valid_move?(4, 4)).to be(true)
      expect(white_pawn.valid_move?(4, 5)).to be(true)
    end

    it 'should return false when a white pawn first move is not valid' do      
      expect(white_pawn.valid_move?(4, 3)).to be(false)  
      expect(white_pawn.valid_move?(4, 7)).to be(false)
    end

    it 'should return true when a black pawn first move is valid' do      
      expect(black_pawn.valid_move?(4, 2)).to be(true)
      expect(black_pawn.valid_move?(4, 3)).to be(true)
    end

    it 'should return false when a black pawn first move is not valid' do      
      expect(black_pawn.valid_move?(4, 0)).to be(false) 
      expect(black_pawn.valid_move?(4, 4)).to be(false)             
    end

    # Testing for after the first move
    it 'should return true when a white pawn second move is valid' do      
      expect(white_pawn_2.valid_move?(4, 5)).to be(true)
    end

    it 'should return false when a white pawn second move is not valid' do     
      expect(white_pawn_2.valid_move?(4, 4)).to be(false)  
      expect(white_pawn_2.valid_move?(4, 7)).to be(false)      
    end

    it 'should return true when a black pawn second move is valid' do      
      expect(black_pawn_2.valid_move?(4, 2)).to be(true)
    end

    it 'should return false when a black pawn second move is not valid' do     
      expect(black_pawn_2.valid_move?(4, 0)).to be(false) 
      expect(black_pawn_2.valid_move?(4, 3)).to be(false)      
    end
  end
end
