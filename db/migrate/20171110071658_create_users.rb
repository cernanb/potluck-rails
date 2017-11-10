class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.text :image
      t.string "facebook_oauth_token"
      t.timestamps
    end
  end
end
