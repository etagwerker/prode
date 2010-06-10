class CreateTopFours < ActiveRecord::Migration
  def self.up
    create_table :top_fours do |t|
      t.string :first
      t.string :second
      t.string :third
      t.string :fourth
      t.integer :user_id

      t.timestamps
    end
    
    User.find(:all).each do |user|
      user.top_four = TopFour.new
      user.save
    end
  end

  def self.down
    drop_table :top_fours
  end
end
