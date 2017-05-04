class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.belongs_to :event
      t.date :datetime_from
      t.date :datetime_to
      t.integer :price
      t.integer :capacity

      t.timestamps
    end
  end
end
