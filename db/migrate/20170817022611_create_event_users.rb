class CreateEventUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_users do |t|
      t.references :Event, foreign_key: true
      t.references :User, foreign_key: true

      t.timestamps
    end
  end
end
