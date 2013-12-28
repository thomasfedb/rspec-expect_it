require "rspec"

require "rspec/expect_it/version"
require "rspec/expect_it/helpers"

RSpec.configure do |config|
  config.include Rspec::ExpectIt::Helpers
end