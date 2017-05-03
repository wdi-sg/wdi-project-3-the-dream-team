class CreateDummyModels < ActiveRecord::Migration[5.0]
  def change
    create_table :dummy_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
