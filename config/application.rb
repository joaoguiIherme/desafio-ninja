require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module MeetingsAgendaApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
    config.api_only = true
    config.autoloader = :classic
  end
end
