
class Flight < ApplicationRecord
    belongs_to :flight_type
    has_many :seat_layouts

    enum cities: {
    blore: "Banglore",
    goa: "Goa",
    hyd: "Hyderabad",
    che: "Chennai"
  }
  accepts_nested_attributes_for :seat_layouts
end
