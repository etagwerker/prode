json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :omniauth_provider, :omniauth_hash, :omniauth_uid, :profile_image_url
  json.url user_url(user, format: :json)
end
