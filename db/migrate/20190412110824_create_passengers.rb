class CreatePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :passengers do |t|
      t.integer :booking_id
      t.string :full_name
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
