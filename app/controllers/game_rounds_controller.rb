class GameRoundsController < ApplicationController
  def index
    render json: GameRound.all
  end

  def create
    # TODO: figure out how to use strong params with the post rather than permit!
    params.permit!
    params[:game_round].each { |round| GameRound.create(round) }

    render json: GameRound.all
  end

  private

  def round_params
    params.require(:game_round).permit(:game_id, :sentence, :drawing)
  end
end
