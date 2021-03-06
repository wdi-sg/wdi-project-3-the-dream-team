class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.belongs_to :event
      t.datetime :datetime_from
      t.datetime :datetime_to
      t.integer :price
      t.integer :capacity
      t.integer :pax
      t.timestamps
    end
  end
end
