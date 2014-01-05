class ChannelsController < ActionController::Base
  def next
    streams = $twitch.searchStreams(query: {game: params["game_name"]})
    stream = streams[:body]["streams"].first
    render json: stream
  end
end