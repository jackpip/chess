class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
  end

  def  create
    @game = current_user.white_games.create(game_params)
    if @game.valid?
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end

end
