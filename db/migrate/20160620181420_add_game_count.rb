class AddGameCount < ActiveRecord::Migration
  def change
    create_table :game_counts do |t|
      t.integer :times_played
    end
  end
end
