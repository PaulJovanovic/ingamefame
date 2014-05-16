class UsersController < ApplicationController
  skip_before_filter :load_game_list

  def new
    user = User.new(params[:user])
    if user.save
      render json: {success: true}
    else
      render json: {success: false, errors: user.errors.messages}
    end
  end

  def create

  end

  def edit

  end

  def update

  end
end