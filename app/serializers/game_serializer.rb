class GameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :created_at, :game_rounds
end
