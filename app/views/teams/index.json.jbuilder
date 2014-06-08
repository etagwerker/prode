json.array!(@teams) do |team|
  json.extract! team, :id, :name, :points, :goals_for, :goals_against, :difference
  json.url team_url(team, format: :json)
end
