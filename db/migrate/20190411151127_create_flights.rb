class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :flight_type_id
      t.integer :user_id
      t.string :origin
      t.string :destnation
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
