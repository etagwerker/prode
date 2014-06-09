class Tournament < ActiveRecord::Base
  extend FriendlyId

  belongs_to :owner, class_name: "User"
  has_and_belongs_to_many :users
  has_many :forecasts

  friendly_id :name, use: :slugged

  validates :name, presence: true

  # Creates all the forecasts for the User
  #
  # @param user [User]
  # @return [Array]
  def create_forecasts(user)
    forecasts = []
    Game.all.each do |game|
      forecasts << Forecast.create(game: game, user: user, tournament: self)
    end

    forecasts
  end
end
