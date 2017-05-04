class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :craftee
      t.belongs_to :session
      t.string :invoice_id
      t.string :status

      t.timestamps
    end
  end
end
