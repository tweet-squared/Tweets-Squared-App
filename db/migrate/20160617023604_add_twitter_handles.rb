class AddTwitterHandles < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.references :topic
      t.string :twitter_handle
      t.integer :owner
      t.timestamps
    end
  end
end
