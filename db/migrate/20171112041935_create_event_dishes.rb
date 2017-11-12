class CreateEventDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :event_dishes do |t|
      t.boolean :claimed, default: false
      t.integer :dish_id
      t.integer :event_id
      t.integer :user_id
      t.timestamps
    end
  end
end
