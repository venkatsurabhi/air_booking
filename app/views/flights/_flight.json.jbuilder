json.extract! flight, :id, :flight_type_id, :user_id, :origin, :destnation, :departure, :arrival, :created_at, :updated_at
json.url flight_url(flight, format: :json)
