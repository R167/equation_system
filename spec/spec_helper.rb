$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'equation_system'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]  # default, enables both `should` and `expect`
  end
end
