class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :group_id, null: false
      t.integer :points, default: 0
      t.integer :goals_for, default: 0
      t.integer :goals_against, default: 0
      t.integer :difference, default: 0

      t.timestamps
    end
  end
end
