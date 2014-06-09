class AddUsersTournamentsTable < ActiveRecord::Migration
  def change
    create_table :tournaments_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :tournament
    end
  end
end
