class GameSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :game_rounds
end
