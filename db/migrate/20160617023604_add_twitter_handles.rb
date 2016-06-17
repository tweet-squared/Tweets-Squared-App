class AddTwitterHandles < ActiveRecord::Migration
  def change
    create_table :twitter_handles do |t|
      t.references :topic
      t.string :twitter_handle
      t.integer :real_twitter_handle_id
      t.timestamps
    end
  end
end
