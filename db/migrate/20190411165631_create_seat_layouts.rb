class CreateSeatLayouts < ActiveRecord::Migration[5.0]
  def change
    create_table :seat_layouts do |t|
      t.integer :flight_class_id
      t.integer :rows
      t.integer :seats
      t.integer :total_seats
      t.integer :flight_id
      t.float :fare

      t.timestamps
    end
  end
end
