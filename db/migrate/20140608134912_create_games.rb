class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :local_id, null: false
      t.integer :visitor_id, null: false
      t.integer :group_id
      t.timestamp :time
      t.integer :order_number
      t.string :city

      t.timestamps
    end
  end
end
