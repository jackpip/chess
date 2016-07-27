class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def  create
    @game = current_user.games.create(game_params)
    if @game.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def game_params
    params.require(:game).permit(:name, :white_user_id, :black_user_id, :winning_user_id)
  end

end
