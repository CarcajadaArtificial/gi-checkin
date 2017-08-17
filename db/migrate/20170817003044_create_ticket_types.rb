class CreateTicketTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :ticket_types do |t|
      t.float :ticketType_price
      t.string :ticketType_name

      t.timestamps
    end
  end
end
