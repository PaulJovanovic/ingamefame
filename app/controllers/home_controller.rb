class HomeController < ApplicationController
  def index
    @games = $twitch.getTopGames[:body]["top"].map{|game| game["game"]}

    if signed_in?
      # cookies[:channel] = cookies[:channel] || @games[0]["name"]
      cookies[:channel] = @games[0]["name"]
      # streams = $twitch.searchStreams(query: {game: cookies[:channel]})
      # @stream = streams[:body]["streams"].first
      @stream = {}
      @stream["channel"] = $twitch.getChannel("superjova")[:body]
      @channels = current_user.channels
    else
      @user = User.new
      # @stream = $twitch.searchStreams(query: {game: @games[0]["name"]})[:body]["streams"][0]
      @stream = {}
      @stream["channel"] = $twitch.getChannel("superjova")[:body]
    end
  end
end