class PiecesController < ApplicationController
  before_action :authenticate_user!

  def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @piece.update_attributes(piece_params)
    redirect_to games_path(@game)
  end

  private

  def piece_params
     params.require(:piece).permit(:current_position_x, :current_position_y)
  end


end
