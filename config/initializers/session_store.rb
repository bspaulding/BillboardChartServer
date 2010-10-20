# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_billboard_chart_server_session',
  :secret      => 'e9801f75c79a8f37bd0978fc32e030f117cebb8e1c886e0d171dd8188471ceda7394c515c0274992d664504bd55d0fe8f7d4d4992f09eecceb7ffebad5886012'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
