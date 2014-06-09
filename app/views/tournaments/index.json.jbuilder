json.array!(@tournaments) do |tournament|
  json.extract! tournament, :id, :name, :owner_id
  json.url tournament_url(tournament, format: :json)
end
