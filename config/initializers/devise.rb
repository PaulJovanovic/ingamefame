Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email, :username ]

  config.strip_whitespace_keys = [ :email, :username ]

  config.authentication_keys = [ :username ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.http_authenticatable_on_xhr = false

  config.navigational_formats = ["*/*", :html, :json]
end
