# require "bundler/setup"
# require "omniauth/eve_o"
#
# RSpec.configure do |config|
#   # Enable flags like --only-failures and --next-failure
#   config.example_status_persistence_file_path = ".rspec_status"
#
#   # Disable RSpec exposing methods globally on `Module` and `main`
#   config.disable_monkey_patching!
#
#   config.expect_with :rspec do |c|
#     c.syntax = :expect
#   end
# end


$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'rspec'
require 'rack/test'
require 'webmock/rspec'
require 'omniauth'
require 'omniauth-eve_o'

WebMock.disable_net_connect!
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend OmniAuth::Test::StrategyMacros, type: :strategy
end
