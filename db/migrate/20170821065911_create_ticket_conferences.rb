class CreateTicketConferences < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_conferences do |t|
      t.boolean :TicketConference_assistance
      t.references :ticket, foreign_key: true
      t.references :conference, foreign_key: true

      t.timestamps
    end
  end
end
