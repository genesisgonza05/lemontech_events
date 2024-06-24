class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :event_date_time
      t.string :location
      t.integer :capacity
      t.text :requirements
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
