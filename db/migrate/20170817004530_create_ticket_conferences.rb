class CreateTicketConferences < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_conferences do |t|
      t.boolean :ticketConference_assistance
      t.references :Ticket
      t.references :Conference

      t.timestamps
    end
  end
end
