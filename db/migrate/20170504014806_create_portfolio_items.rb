class CreatePortfolioItems < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_items do |t|
      t.string :media_link
      t.string :description
      t.string :item_type
      t.belongs_to :crafter

      t.timestamps
    end
  end
end
