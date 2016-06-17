class Tweet < ActiveRecord::Base

  belongs_to :twitter_handle

  validates :content,
    presence: true

end