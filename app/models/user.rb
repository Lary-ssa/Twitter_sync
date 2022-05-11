class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true 
    has_many :twitter_messages

    TWITTER_CLIENT = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["CONSUMER_KEY"]
        config.consumer_secret     = ENV["CONSUMER_SECRET"]
        config.access_token        = ENV["ACCESS_TOKEN"]
        config.access_token_secret = ENV["ACCESS_SECRET"]
      end

    def self.sync_all 
        User.in_batches.each_with_index do |users, index|
            users.each do |user|
              begin
                TWITTER_CLIENT.user_timeline(user.username).each do |user_timeline|
                  next if TwitterMessage.exists?(timeline_id: user_timeline.id)
                  TwitterMessage.create(user: user, timeline_id: user_timeline.id, data: user_timeline.attrs)
                end
              rescue => e
                puts e.message  
                puts "#{user.username} - cant sync"
              end
            end
          end
    end
end
