class CreateEventDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :event_details do |t|

      t.timestamps
    end
  end
end
