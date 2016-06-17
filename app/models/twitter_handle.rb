class TwitterHandle < ActiveRecord::Base

  belongs_to :topic

  validates :handle, presence: true

end