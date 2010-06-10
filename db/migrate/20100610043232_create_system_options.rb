class CreateSystemOptions < ActiveRecord::Migration
  def self.up
    create_table :system_options do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
    
    SystemOption.new(:key => FIRST_PHASE_ON_KEY, :value => 'false').save!
  end

  def self.down
    drop_table :system_options
  end
end
