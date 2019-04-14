class Booking < ApplicationRecord
    has_many :passengers

    accepts_nested_attributes_for :passengers
    belongs_to :flight
    belongs_to :seat_layout
    belongs_to :user
    before_create :set_fare
    after_create :update_seat_layout
    attr_accessor :booking_canceled

    def set_fare
        self.fare = self.seat_layout.fare * self.seats
    end    

    def update_seat_layout
        unless booking_canceled
            self.seat_layout.avail_seats(self.seats)
        else
            self.seat_layout.add_cancelled_seats
        end        
    end    

end
