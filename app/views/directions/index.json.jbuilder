json.array!(@directions) do |direction|
  json.extract! direction, :d_id, :d_desc
  json.url direction_url(direction, format: :json)
end
