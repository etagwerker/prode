# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_prode_session',
  :secret      => '047888baf02c660934589d0c14744ab0ea6f14a8d1cd536242c3db6c7bd82a52259ffc241bf9f756effe504a1117b4bb65db7cbd3caa50f9353b7fa46dca7a09'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
