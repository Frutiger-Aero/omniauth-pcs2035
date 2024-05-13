$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'rspec'
require 'omniauth'
require 'omniauth-pcs2035'

Dir[File.expand_path('../support/**/*', __FILE__)].each { |f| require f }

OmniAuth.config.test_mode = true

RSpec.configure do |config|
end
