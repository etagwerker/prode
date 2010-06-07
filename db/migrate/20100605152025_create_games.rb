class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_goals
      t.integer :away_goals
      t.integer :number
      t.timestamp :datetime
      t.string :result

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
