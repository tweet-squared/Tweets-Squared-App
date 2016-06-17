class AddTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :twitter_handle
      t.string :content
      t.timestamps
    end
  end
end
