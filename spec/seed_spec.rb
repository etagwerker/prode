require 'spec_helper'
require 'rails_helper'

describe "seed" do

  it "should seed the database with the initial games" do
    Rails.application.load_tasks
    Rake::Task["db:seed"].invoke
    assert_equal Group.count, 8
    assert_equal Team.count, 32

    Group.all.each do |g|
      assert_equal g.teams.count, 4
      assert_equal g.games.count, 6
    end

    assert_equal Game.count, 48
  end

end
