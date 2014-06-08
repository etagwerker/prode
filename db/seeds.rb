require 'json'

json = JSON.load(File.open(File.join(Rails.root, 'db/seeds.json')))

puts json

json.each do |game|
  group = Group.where(name: game['group']).first ||
            Group.create(name: game['group'])
  
  local = Team.where(name: game['local']).first ||
            Team.create(name: game['local'], group_id: group.id)
  visitor = Team.where(name: game['visitor']).first ||
              Team.create(name: game['visitor'], group_id: group.id)

  unless Game.where(local_id: local.id, visitor_id: visitor.id, group_id: group.id).first
    Game.create(local_id: local.id, visitor_id: visitor.id, group_id: group.id)
  end
end
