class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :ticket_reference
      t.integer :ticket_ticketTypeId
      t.string :ticket_name
      t.string :ticket_schoolId
      t.string :ticket_email
      t.string :ticket_sex
      t.integer :ticket_age
      t.string :ticket_course
      t.integer :ticket_semester
      t.string :ticket_university
      t.string :ticket_other
      t.integer :ticket_badgeNumber
      t.string :ticket_conference1
      t.string :ticket_conference2
      t.boolean :ticket_preregistered
      t.boolean :ticket_registered
      t.timestamps
    end
  end
end
