class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :client_key
      t.string :admin_key

      t.timestamps
    end
  end
end
