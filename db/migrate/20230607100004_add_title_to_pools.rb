class AddTitleToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :title, :string
  end
end
