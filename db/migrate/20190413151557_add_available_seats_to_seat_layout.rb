class AddAvailableSeatsToSeatLayout < ActiveRecord::Migration[5.0]
  def change
    add_column :seat_layouts, :available_seats, :integer
  end
end
