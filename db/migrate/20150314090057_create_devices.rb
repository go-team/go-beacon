class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :blue_tooth_id
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
