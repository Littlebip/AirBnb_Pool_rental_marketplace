class AddImagesToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :images, :json
  end
end
