class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :crafter

      t.timestamps
    end
  end
end
