class UserJob
    include Sidekiq::Worker
    include Sidekiq::Status::Worker
  
    def perform
      User.sync_all
    end
  end