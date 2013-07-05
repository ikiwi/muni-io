json.array!(@directions) do |direction|
  json.extract! direction, :r_id, :ib_id, :ib_desc, :ob_id, :ob_desc
  json.url direction_url(direction, format: :json)
end
