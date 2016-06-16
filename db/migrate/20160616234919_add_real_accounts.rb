class AddRealAccounts < ActiveRecord::Migration
  def change
    create_table :real_accounts do |t|
      t.string :twitter_handle
      t.references :topic
    end
  end
end
