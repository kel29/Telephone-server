class GamesController < ApplicationController
  def index
    render json: Game.all
  end

  def create
    game = Game.new(game_params)
    game.save

    render json: game
  end

  def show
    game = Game.find(params[:id])

    render json: game
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)

    render json: game
  end

  private

  def game_params
    params.require(:game).permit(:user_id, :user_removed)
  end
end
