require "omniauth-oauth2"
require_relative "omniauth/strategies/unti"
require_relative "omniauth-pcs2035/version"

OmniAuth.config.add_camelization('unti', 'Unti')
