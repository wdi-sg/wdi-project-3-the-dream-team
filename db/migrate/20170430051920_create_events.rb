class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.belongs_to :crafter
      t.belongs_to :category

      t.timestamps
    end
  end
end
