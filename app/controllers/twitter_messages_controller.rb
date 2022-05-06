class TwitterMessagesController < ApplicationController
  def index
    @users = User.all
  end
end
