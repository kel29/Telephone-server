class GameRoundSerializer < ActiveModel::Serializer
  attributes :id, :game_id, :contributor, :sentence, :drawing, :created_at
end
