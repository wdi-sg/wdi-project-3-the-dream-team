class CreateFeaturedCrafters < ActiveRecord::Migration[5.0]
  def change
    create_table :featured_crafters do |t|
      t.string :media_link
      t.text :description
      t.belongs_to :crafter

      t.timestamps
    end
  end
end
