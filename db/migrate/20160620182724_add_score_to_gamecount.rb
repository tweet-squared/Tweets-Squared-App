class AddScoreToGamecount < ActiveRecord::Migration
  def change
    add_column :game_counts, :score, :integer
    add_column :game_counts, :total, :integer
  end
end
