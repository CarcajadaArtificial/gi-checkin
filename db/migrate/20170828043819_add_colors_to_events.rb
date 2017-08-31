class AddColorsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_color1, :string
    add_column :events, :event_color2, :string
  end
end
