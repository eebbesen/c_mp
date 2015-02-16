json.array!(@lakes) do |lake|
  json.extract! lake, :id, :lake_name, :lake_number, :site_number, :county
  json.url lake_url(lake, format: :json)
end
