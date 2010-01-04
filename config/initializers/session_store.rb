# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eurogamer2009_session',
  :secret      => 'f9b58d781d0de109a596c7d39ff4882dc6894848ade9b84547350962cb5a995aec22853d96f53dfcc54fbed3f6cb833462b39cbfa9705986d93ee06405b719d0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
