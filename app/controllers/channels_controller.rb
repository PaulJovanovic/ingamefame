class ChannelsController < ActionController::Base
  def change
    cookies[:channel] = params[:id]
    channel = Channel.find(params[:id])
    streams = channel.findStreamsFor(current_user)
    render json: streams
  end

  def next
    streams = $twitch.searchStreams(query: {game: params["game_name"]})
    stream = streams[:body]["streams"].first
    render json: stream
  end
end