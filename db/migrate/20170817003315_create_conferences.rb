class CreateConferences < ActiveRecord::Migration[5.0]
  def change
    create_table :conferences do |t|
      t.string :conference_name
      t.datetime :conference_date
      t.integer :conference_capacity
      t.integer :conference_attendance
      t.text :conference_description
      t.string :conference_speaker
      t.string :conference_location

      t.timestamps
    end
  end
end
