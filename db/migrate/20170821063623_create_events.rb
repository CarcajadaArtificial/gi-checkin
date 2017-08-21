class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :event_startDate
      t.datetime :event_endDate
      t.integer :event_capacity
      t.integer :event_attendance
      t.text :event_description
      t.boolean :event_onlyStudents

      t.timestamps
    end
  end
end
