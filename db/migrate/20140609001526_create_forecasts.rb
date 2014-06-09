class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :home_goals
      t.integer :away_goals
      t.integer :winner_id
      t.integer :tournament_id

      t.timestamps
    end
  end
end
