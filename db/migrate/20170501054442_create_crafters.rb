class CreateCrafters < ActiveRecord::Migration[5.0]
  def change
    create_table :crafters do |t|
      t.belongs_to :user
      t.belongs_to :category
      t.string :name
      t.text :biography
      t.string :profession
      t.string :contact_number
      t.string :contact_email
      t.string :facebook_link
      t.string :twitter_link
      t.string :website_link

      t.timestamps
    end
  end
end
