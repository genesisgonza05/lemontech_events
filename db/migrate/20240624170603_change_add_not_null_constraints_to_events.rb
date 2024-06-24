class ChangeAddNotNullConstraintsToEvents < ActiveRecord::Migration[7.1]
  def change
    change_column_null :events, :name, false
    change_column_null :events, :event_date_time, false
    change_column_null :events, :location, false
    change_column_null :events, :capacity, false
  end
end
