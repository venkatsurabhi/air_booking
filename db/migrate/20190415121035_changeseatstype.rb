class Changeseatstype < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :seats, :integer
  end
end
