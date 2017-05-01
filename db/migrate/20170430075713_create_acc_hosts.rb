class CreateAccHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :acc_hosts do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
