class AddDetailsToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :details, :text
  end
end
