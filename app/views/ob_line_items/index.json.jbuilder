json.array!(@ob_line_items) do |ob_line_item|
  json.extract! ob_line_item, :route_id, :direction_id, :stop_id
  json.url ob_line_item_url(ob_line_item, format: :json)
end
