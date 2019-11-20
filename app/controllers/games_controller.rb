class GamesController < ApplicationController
  def index
    render json: Game.all
  end

  def create
    game = Game.new(game_params)
    game.save

    render json: game
  end

  private

  def game_params
    params.require(:game).permit(:user_id)
  end
end
