class Highscore
  include Mongoid::Document

  field :username, type: String
  field :score, type: Integer
  field :game, type: String

  validates :username, presence: true
  validates :score, presence: true
  validates :game, presence: true
end