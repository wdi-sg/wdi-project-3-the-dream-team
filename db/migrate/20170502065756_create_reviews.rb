class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :craftee
      t.belongs_to :event
      t.text :description
      t.string :rating

      t.timestamps
    end
  end
end
