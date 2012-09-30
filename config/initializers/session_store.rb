# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wpd_session',
  :secret      => '14b4f72dd13a20f02ea50550ec9de4636c3942c48f834de07b589289783601f1255e16462a079afa26190bd02030d2b3dacba7f5d25c3bf88acb4ee73c3fbd32'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
