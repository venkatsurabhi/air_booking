module BookingsHelper
    def seat_available?(seat, layout)
        layout.totalseats.where('seat_no=? and passenger_id is not null', seat).first
    end    
end
