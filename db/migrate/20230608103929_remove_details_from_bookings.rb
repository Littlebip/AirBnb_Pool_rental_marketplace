class RemoveDetailsFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :details
  end
end
