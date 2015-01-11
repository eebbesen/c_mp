json.array!(@citizens) do |citizen|
  json.extract! citizen, :id, :first_name, :last_name, :clmp_number, :email, :phone_1, :phone_2
  json.url citizen_url(citizen, format: :json)
end
