class CreateCrafters < ActiveRecord::Migration[5.0]
  def change
    create_table :crafters do |t|
      t.belongs_to :user

      t.timestamps
    end
  end
end
