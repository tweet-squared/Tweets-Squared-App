class Topic < ActiveRecord::Base

  has_many :twitter_handles

  validates :topic, presence: true

end
