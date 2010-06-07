require 'digest/sha1'
class HashUserPasswords < ActiveRecord::Migration
  def self.up
    rename_column :users, :password, :hashed_password
    User.find(:all).each do |user|
      user.hashed_password = Digest::SHA1.hexdigest(user.hashed_password)[0..39]
      user.save
    end
  end

  def self.down
    rename_column :users, :hashed_password, :password
  end
end
