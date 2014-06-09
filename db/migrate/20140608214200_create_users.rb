class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :omniauth_provider
      t.text :omniauth_hash
      t.string :omniauth_uid
      t.string :profile_image_url
      t.string :slug, unique: true

      t.timestamps
    end

    add_index :users, [:omniauth_provider, :omniauth_uid], unique: true
  end
end
