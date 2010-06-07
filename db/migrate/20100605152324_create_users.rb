class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :nick
      t.boolean :admin
      t.integer :score, :default => 0

      t.timestamps
    end
    
    User.new(:email => 'ernesto@etagwerker.com', :password => 'test123', :nick => 'etagwerker', :admin => true).save
  end

  def self.down
    drop_table :users
  end
end
