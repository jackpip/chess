class PiecesController < ApplicationController
  before_action :authenticate_user!

  def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game_id
    @piece.update_attributes(piece_params)
    render json: nil, status: :ok
    #redirect_to game_path(@game)
  end

  private

  def piece_params
     params.require(:piece).permit(:current_position_x, :current_position_y)
  end


end
