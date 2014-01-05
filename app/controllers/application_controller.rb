class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_game_list

  def load_game_list
    @games = $twitch.getTopGames[:body]["top"].map{|game| game["game"]}
  end
end
