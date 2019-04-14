class Seat < ApplicationRecord
    belongs_to :flight
    belongs_to :seat_layout
    belongs_to :passenger
end
