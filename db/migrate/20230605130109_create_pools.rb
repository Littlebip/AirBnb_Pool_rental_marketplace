class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.string :address
      t.string :size
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
