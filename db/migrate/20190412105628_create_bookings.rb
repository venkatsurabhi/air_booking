class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|

      t.integer :flight_id
      t.integer :flight_class_id
      t.integer :seats
      t.integer :user_id
      t.boolean :cancelled, default: false
      t.float :fare
      t.integer :seat_layout_id
      t.timestamps
    end
  end
end
