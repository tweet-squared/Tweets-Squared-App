class TwitterHandle < ActiveRecord::Base

  belongs_to :topic

  has_many :tweets

  validates :twitter_handle, presence: true

end
