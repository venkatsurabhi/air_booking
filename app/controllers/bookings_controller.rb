class BookingsController < ApplicationController

  
  before_action :authenticate_user!, except: [:select_seats, :checkin]
  load_and_authorize_resource

    def new
        @booking = Booking.new(seat_layout_id: params[:seat_layout_id],flight_id: params[:flight_id],
         flight_class_id: params[:flight_class_id], seats: params[:seats])
        params[:seats].to_i.times do |i|
          @booking.passengers.build
        end    
    end   

    def checkin_seats
      @booking = Booking.joins(:user).joins(:passengers).
      where("pnr=?", params[:pnr]).first
      if params[:selected_seats].count > @booking.seats.to_i
        redirect_to '/checkin', notice: "Select only #{@booking.seats} seats"
      else
        passenger_ids = @booking.passenger_ids
        params[:selected_seats].each_with_index do |seat,i|
          seat_obj = @booking.flight.seats.where('seat_no=?', seat.to_s).first
          seat_obj.passenger_id = passenger_ids[i]
          seat_obj.booking_id = @booking.id
          seat_obj.save
        end
        render partial: 'checkin'
      end    
    end

    def select_seats
      if current_user.admin?
        @booking = Booking.joins(:user).joins(:passengers).
        where("pnr=?",params[:pnr]).first
      else  
        @booking = Booking.joins(:user).joins(:passengers).
        where("users.id=? and pnr=?",current_user.id,params[:pnr]).first
      end  
      unless @booking
        redirect_to '/checkin', notice: 'Enter valid pnr number'
      else
        @flight = @booking.flight  
        
      end   
    end  

    def show
      @booking = Booking.find(params[:id])
    end  

    def create
        params[:booking][:user_id] = current_user.id
        @booking = Booking.new(booking_params)
        respond_to do |format|
            if @booking.save
              format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
            else
              format.html { render :new }
            end
        end
    end 

    def index

    end  
    
  private
  def booking_params
    params.require(:booking).permit( 
    :flight_class_id, :flight_id, :seats, :user_id, :seat_layout_id,
    passengers_attributes: [:full_name, :age, :gender])
  end    
end
