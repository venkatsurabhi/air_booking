module BookingsHelper
    def seat_available?(seat, layout)
        layout.total_seats.where('seat_no=? and passenger_id is not null', seat).first
    end    
end
