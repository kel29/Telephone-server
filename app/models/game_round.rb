class GameRound < ApplicationRecord
  belongs_to :game
  has_one_attached :drawing, service: :s3
end
