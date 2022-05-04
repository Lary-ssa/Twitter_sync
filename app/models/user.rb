class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    def self.sync_all 
        client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV["CONSUMER_KEY"]
            config.consumer_secret     = ENV["CONSUMER_SECRET"]
            config.access_token        = ENV["ACCESS_TOKEN"]
            config.access_token_secret = ENV["ACCESS_SECRET"]
        end
        messages=[]
        User.all.each do |user| 
            client.user_timeline(user.username).each do |user_timeline|
                messages << user_timeline.text
            end
        end
        messages
    end
end
