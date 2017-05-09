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
      t.string :profilePic_link

      # columns for stripe integration
      t.string :publishable_key
      t.string :secret_key
      t.string :stripe_user_id
      t.string :currency
      t.string :stripe_account_type
      t.timestamps
    end
  end
end
