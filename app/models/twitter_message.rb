class TwitterMessage < ApplicationRecord
  belongs_to :user
  after_create do 
   # broadcast_prepend_to "twitter_messages"
  broadcast_prepend_to "twitter_messages", target:"twitter_messages", partial:"twitter_messages/twitter_message", locals:{twitter_message: self}
  end
end
