class Users::ChannelsController < ApplicationController
  def create
    channel = Channel.new(params[:channel])
    if channel.save
      cookies[:channel] = channel.id
      render json: {success: true, channel: channel}
    else
      render json: {success: false, errors: channel.errors.messages}
    end
  end
end