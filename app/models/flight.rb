
class Flight < ApplicationRecord
  belongs_to :flight_type
  has_many :seat_layouts
  has_many :seats

    enum cities: {
    blore: "Banglore",
    goa: "Goa",
    hyd: "Hyderabad",
    che: "Chennai"
  }
  enum passengers: [1,2,3,4,5,6,7,8,9,10]

  accepts_nested_attributes_for :seat_layouts

  scope :departure, -> (date){  where(departure: date.beginning_of_day..date.end_of_day) }
  scope :from_city, -> (source) {where(origin: source)}
  scope :to_city, -> (source) {where(destination: source)}

  after_commit :create_seats


  def self.search_flights(query_params)
    Flight.departure(query_params[:departure].to_date).from_city(query_params[:from])
    .to_city(query_params[:to])
  end  

  def get_seat_layout(flight_class_id)
    self.seat_layouts.where(flight_class_id: flight_class_id).first
  end  

  def create_seats
    i = 1
    self.seat_layouts.order('flight_class_id desc').each do |layout|
      layout.total_seats.times do
        Seat.create(flight_id: self.id, seat_layout_id: layout.id, seat_no: i)
        i += 1
      end  
    end    
  end  

end
