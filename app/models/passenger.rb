class Passenger < ApplicationRecord
    belongs_to :booking, optional: true
    has_one :seat
    has_pretty_id method: :urlsafe_base64,          
                column: :pnr,   
                length: 8                      
end
