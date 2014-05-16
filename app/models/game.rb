class Game < ActiveRecord::Base
  has_many :streamers, foreign_key: "main_game_id"
  has_one :channel, as: :channelable
end