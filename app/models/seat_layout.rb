
class SeatLayout < ApplicationRecord
    belongs_to :flight, optional: true
    belongs_to :flight_class

    after_create :set_seats

    def set_seats
        self.total_seats = self.rows * self.seats
        self.save
    end    
end
