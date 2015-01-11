json.array!(@samples) do |sample|
  json.extract! sample, :id, :date, :time, :secchi_depth, :is_bottom, :physical_appearance, :recreational_suitability, :water_color, :notes
  json.url sample_url(sample, format: :json)
end
