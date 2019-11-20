class Game < ApplicationRecord
  has_many :game_rounds, dependent: :destroy
  belongs_to :user
end
