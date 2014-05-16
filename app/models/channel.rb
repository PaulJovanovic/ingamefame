class Channel < ActiveRecord::Base
  belongs_to :channelable, polymorphic: true
  has_and_belongs_to_many :users

  def find_streams_for(user)
    # base off of user likes / dislikes
    # disliked streams will not be returned
    # liked streams have a bonus ranking
    []
  end
end