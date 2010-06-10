class ModifyUserScoreAttributes < ActiveRecord::Migration
  def self.up
    rename_column :users, :score, :correct_score
    add_column :users, :exact_score, :integer
  end

  def self.down
    rename_column :users, :correct_score
    remove_column :users, :exact_score
  end
end
