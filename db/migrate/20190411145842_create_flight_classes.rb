class CreateFlightClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :flight_classes do |t|
      t.string "name"
      t.timestamps
    end
  end
end
