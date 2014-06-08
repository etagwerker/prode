json.array!(@games) do |game|
  json.extract! game, :id, :local_id, :visitor_id, :time, :order_number, :city
  json.url game_url(game, format: :json)
end
