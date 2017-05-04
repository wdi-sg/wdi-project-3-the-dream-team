class CreateFeaturedEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :featured_events do |t|
      t.string :media_link
      t.text :description
      t.belongs_to :event

      t.timestamps
    end
  end
end
