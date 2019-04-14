class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.integer :flight_id
      t.integer :seat_layout_id
      t.integer :seat_no
      t.integer :passenger_id
      t.integer :booking_id
      t.boolean :allocated, default: false

      t.timestamps
    end
  end
end
