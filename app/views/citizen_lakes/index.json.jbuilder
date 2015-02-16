json.array!(@citizen_lakes) do |citizen_lake|
  json.extract! citizen_lake, :id, :previous_year
  json.url citizen_lake_url(citizen_lake, format: :json)
end
