class CreateTicketTypeConferences < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_type_conferences do |t|
      t.references :Ticket_Type, foreign_key: true
      t.references :Conference, foreign_key: true

      t.timestamps
    end
  end
end
