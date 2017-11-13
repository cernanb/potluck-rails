class AddLocationAndContactToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :location, :string
    add_column :events, :contact, :string
  end
end
