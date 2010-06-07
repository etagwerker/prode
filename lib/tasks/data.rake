require 'active_record'
require 'group'

def get_team(team_name, group)
  result = Team.find_by_name(team_name)
  unless result
    result = Team.new(:name => team_name, :group_id => group.id)
    puts "Created team #{team_name} from group #{group.name}"
    result.save
  end
  result
end

namespace :initial_data do
  task :load => :environment do
    Team.delete_all
    Group.delete_all
    Game.delete_all
    file = File.new("./public/mundial-fase1.csv")
    group = nil
    file.each_line do |line|
      array = line.split(',')
      array.collect! do |string| 
        string.gsub(/"/,'')
      end
      if array[0].match(/^Group*/)
        group = Group.new
        group.name = array[0].match(/^Group (.*)$/).captures[0]
        group.save
        puts "Created group #{group.name}"
      elsif array[0].match(/^Match*/)
        next
      else
        g = Game.new
        g.number =  array[0].to_i
        captures = array[1].match(/^(.*)\/(.*) (.*):(.*)$/).captures
        g.datetime = Time.local(2010, captures[1].to_i, captures[2].to_i, captures[2].to_i, captures[3].to_i)
        home_team = array[4].strip
        away_team = array[6].strip
        g.home_team = get_team(home_team, group)
        g.away_team = get_team(away_team, group)
        g.save
      end
    end
    
    
    User.find(:all).each do |user|
      Game.find(:all).each do |game|
        Forecast.new(:user => user, :game => game).save
      end
    end
    
    puts "Imported #{Game.find(:all).size} games"
    puts "Imported #{Group.find(:all).size} groups"
    puts "Imported #{Team.find(:all).size} teams"
    puts "Created #{Forecast.find(:all).size} forecasts"
  end
end