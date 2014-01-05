class HomeController < ApplicationController
  def index
    #StreamFinder
    streams = $twitch.searchStreams(query: {game: @games[1]["name"]})
    @stream = streams[:body]["streams"].first
    #end StreamFinder
  end
end