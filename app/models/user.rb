class User < ApplicationRecord
  has_many :games
  has_many :game_rounds, through: :games
  validates :name, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
