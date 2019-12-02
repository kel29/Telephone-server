class GameRoundsController < ApplicationController
  def index
    render json: GameRound.all
  end

  def create
    round = GameRound.new(round_params)
    round.save

    render json: round
  end

  private

  def round_params
    params.require(:game_round).permit(:game_id, :sentence, :drawing)
  end
end
