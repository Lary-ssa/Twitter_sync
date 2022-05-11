class TwitterMessagesController < ApplicationController
  def index
    @twitter_messages= TwitterMessage.order(created_at: :desc)
  end
end
