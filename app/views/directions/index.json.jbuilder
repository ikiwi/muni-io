json.array!(@directions) do |direction|
  json.extract! direction, :d_id, :string, :d_desc
  json.url direction_url(direction, format: :json)
end
