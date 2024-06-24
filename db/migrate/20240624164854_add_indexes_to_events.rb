class AddIndexesToEvents < ActiveRecord::Migration[7.1]
  def change
    add_index :events, :name
    add_index :events, :event_date_time
    add_index :events, :capacity
  end
end
