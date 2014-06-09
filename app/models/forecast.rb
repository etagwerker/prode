class Forecast < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  belongs_to :tournament
  belongs_to :winner, class_name: "Team"

  delegate :order_number, :formatted_time, :city, :local, :visitor, to: :game

end
