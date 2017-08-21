class CreateTicketConferences < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_conferences do |t|
      t.boolean :ticketConference_assistance
      t.references :ticket
      t.references :conference

      t.timestamps
    end
  end
end
