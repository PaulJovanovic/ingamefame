class Streamer < ActiveRecord::Base
  has_one :channel, as: :channelable
end