class UpdateUserImage < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :image, :text, default: "https://community.yellowfinbi.com/public/avatars/default-avatar.svg" 
  end
end
