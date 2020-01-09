class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :facebook_id, :games

  def games
    object.games.map do |game|
      {
        game_id: game.id,
        created_at: game.created_at,
        game_rounds: game_rounds(game).sort_by { |rounds| rounds[:created_at] }
      }
    end
  end

  def game_rounds(game)
    game.game_rounds.map do |round|
      {
        id: round.id,
        sentence: round.sentence,
        drawing: round.drawing,
        created_at: round.created_at
      }
    end
  end
end
