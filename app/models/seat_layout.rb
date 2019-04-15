
class SeatLayout < ApplicationRecord
    belongs_to :flight, optional: true
    belongs_to :flight_class
    has_many :totalseats, class_name: 'Seat'

    before_create :set_seats

    def set_seats
        self.total_seats = self.rows * self.seats
        self.available_seats = self.rows * self.seats
    end    

    def avail_seats(seats)
        self.available_seats = self.available_seats.to_i - seats
        self.save
    end    

    def add_cancelled_seats(seats)
        self.available_seats = self.available_seats.to_i + seats
        self.save
    end   

    def seats_available?
        self.available_seats > 0  
    end    
end
