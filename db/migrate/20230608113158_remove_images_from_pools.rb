class RemoveImagesFromPools < ActiveRecord::Migration[7.0]
  def change
    remove_column(:pools, :images)
  end
end
