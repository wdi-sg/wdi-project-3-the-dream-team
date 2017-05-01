class CreateAccGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :acc_guests do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
