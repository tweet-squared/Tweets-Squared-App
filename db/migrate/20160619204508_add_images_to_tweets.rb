class AddImagesToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :media_url, :string
  end
end
