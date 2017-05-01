class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :acc_host

      t.timestamps
    end
  end
end
