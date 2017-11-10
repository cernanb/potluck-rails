class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :text
      t.datetime :date
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.integer :user_id
      t.timestamps
    end
  end
end
