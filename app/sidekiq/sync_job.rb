require 'sidekiq-scheduler'
class SyncJob 
  include Sidekiq::Worker

  def perform
    puts 'Laryssa'
    User.sync_all 
  end
end
