class CreateConferences < ActiveRecord::Migration[5.0]
  def change
    create_table :conferences do |t|
      t.string :cnf_name
      t.integer :cnf_ticketNumber
      t.integer :cnf_capacity
      t.integer :cnf_occupancy
      t.string :cnf_location

      t.timestamps
    end
  end
end
