class AddRoundNumberToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :round_number, :integer
    Game.reset_column_information
    Game.find(:all).each do |game|
      game.round_number = 1
      game.save
    end
    SystemOption.new(:key => ROUND_NUMBER, :value => 1).save!
  end

  def self.down
    SystemOption.find_by_key(ROUND_NUMBER).delete
    remove_column :games, :round_number
  end
end
