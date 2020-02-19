class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :user_id, :created_at, :game_rounds, :user_removed

  def game_id
    object.id
  end

  def game_rounds
    rounds = object.game_rounds.map do |round|
      {
        id: round.id,
        sentence: round.sentence,
        drawing: round.drawing,
        created_at: round.created_at
      }
    end
    rounds.sort_by { |round| round[:created_at] }
  end
end
