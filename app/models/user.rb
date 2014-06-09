class User < ActiveRecord::Base
  extend FriendlyId

  has_many :forecasts
  has_and_belongs_to_many :tournaments

  friendly_id :name, use: :slugged

  # Creates a User using the Omniauth hash.
  # @param auth [Hash]
  # @return [User]
  def self.create_with_omniauth(auth)
    if auth && auth["provider"]
      User.create!( email: auth["info"]["email"],
                    name: auth["info"]["nickname"] || auth["info"]["name"],
                    omniauth_provider: auth["provider"],
                    omniauth_uid: auth["uid"],
                    profile_image_url: auth["info"]["image"],
                    omniauth_hash: auth.to_json )
    end
  end

  def self.from_oauth(auth)
    result = where(omniauth_provider: auth["provider"], omniauth_uid: auth["uid"]).first

    unless result
      result = User.create_with_omniauth(auth)
    end

    result
  end

  def friendly_name
    self.name.split(' ').first
  end

  def join(tournament)
    result = true

    unless tournament.users.find_by_id(self.id)
      tournament.users << self
      tournament.create_forecasts(self)
      result = tournament.save
    end

    result
  end

end
