class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :callback_url
      t.references :user, index: true

      t.timestamps
    end
  end
end
