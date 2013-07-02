json.array!(@stops) do |stop|
  json.extract! stop, :s_id, :s_desc
  json.url stop_url(stop, format: :json)
end
