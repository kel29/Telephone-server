class User < ApplicationRecord
  has_many :games
  has_many :game_rounds, through: :games
  validates :name, presence: true, uniqueness: true
end
