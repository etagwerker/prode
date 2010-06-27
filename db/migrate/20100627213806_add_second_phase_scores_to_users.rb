class AddSecondPhaseScoresToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :second_correct_score, :integer, :default => 0
    add_column :users, :second_exact_score, :integer, :default => 0
    
    Game.reset_column_information    
    Game.find(:all, :conditions => ['round_number > ?',1]).each do |game|
      game.forecasts.each do |forecast|
        if game.result_entered?
          if game.exact?(forecast)
            forecast.user.second_exact_score = forecast.user.second_exact_score.to_i + EXACT_POINTS
          end
          if game.correct?(forecast)
            forecast.user.second_correct_score = forecast.user.second_correct_score.to_i + CORRECT_POINTS
          end
          forecast.user.save
          forecast.collected = true  
          forecast.save          
        end
      end
    end
  end

  def self.down
    remove_column :users, :second_correct_score
    remove_column :users, :second_exact_score
  end
end
