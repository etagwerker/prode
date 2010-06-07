class CreateForecasts < ActiveRecord::Migration
  def self.up
    create_table :forecasts do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :home_goals
      t.integer :away_goals
      t.boolean :collected, :default => false
      t.string :result

      t.timestamps
    end
  end

  def self.down
    drop_table :forecasts
  end
end
