class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.string :att_name
      t.integer :att_idNumber
      t.integer :att_course
      t.integer :att_ticketNumber
      t.integer :att_semester
      t.boolean :att_registered

      t.timestamps
    end
  end
end
