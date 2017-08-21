class CreateTicketTypeConferences < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_type_conferences do |t|
      t.references :ticket_Type, foreign_key: true
      t.references :conference, foreign_key: true

      t.timestamps
    end
  end
end
