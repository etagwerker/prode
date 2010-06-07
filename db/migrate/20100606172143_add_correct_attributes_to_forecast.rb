class AddCorrectAttributesToForecast < ActiveRecord::Migration
  def self.up
    add_column :forecasts, :correct, :boolean, :default => false
    add_column :forecasts, :exact, :boolean, :default => false
  end

  def self.down
    remove_column :forecasts, :correct
    remove_column :forecasts, :exact
  end
end
