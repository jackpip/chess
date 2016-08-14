class PiecesController < ApplicationController
  before_action :authenticate_user!

  def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    x = params[:piece][:current_position_x].to_i
    y = params[:piece][:current_position_y].to_i
    puts '*' * 50
    puts @piece.inspect
    puts params.inspect
    puts params[:piece][:current_position_x].inspect
    puts "checking if #{@piece} can move from #{@piece.current_position_x}, #{@piece.current_position_y} to #{x}, #{y}"
    puts '*' * 50
    if @piece.valid_move?(x, y)
      @piece.update_attributes(piece_params)
      render json: nil, status: :ok
      #redirect_to game_path(@game)
    else
      render text: 'Invalid move!', status: :unauthorized
    end
  end

  private

  def piece_params
     params.require(:piece).permit(:current_position_x, :current_position_y)
  end


end
