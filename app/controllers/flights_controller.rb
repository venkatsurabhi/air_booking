class FlightsController < ApplicationController

 
  before_action :authenticate_user!, except: [:search]
  load_and_authorize_resource :except => [:search]
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
    FlightClass.all.each do |fc|
      @flight.seat_layouts.build(flight_class_id: fc.id )
    end  
  end
  
  def search
    @flight = Flight.new
    if !params[:departure].blank?
      @flights = Flight.search_flights(departure: params[:departure].to_s, from: params[:from], to: params[:to])      
      if @flights.count > 0
        render :file => '/flights/flights'#,  layout: 'application'  
      else
          
      end  
    end    
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params.require(:flight).permit( 
      :flight_type_id, :user_id, :origin, :destination, :departure, :arrival,
      seat_layouts_attributes: [:rows, :seats,:fare,:flight_class_id])
    end
end
