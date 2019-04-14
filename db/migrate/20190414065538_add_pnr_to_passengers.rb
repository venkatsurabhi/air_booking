class AddPnrToPassengers < ActiveRecord::Migration[5.0]
  def change
    add_column :passengers, :pnr, :string
  end
end
