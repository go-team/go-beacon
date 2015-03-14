class FixDevice < ActiveRecord::Migration
  def change
    drop_table :devices
    create_table :devices do |t|
      t.string :bluetooth_id
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end

  end
end
