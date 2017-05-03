class CreateFavEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :fav_events do |t|
      t.belongs_to :craftee
      t.belongs_to :event
      t.timestamps
    end
  end
end
