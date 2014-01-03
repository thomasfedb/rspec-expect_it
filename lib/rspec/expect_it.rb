require "rspec"

require "rspec/expect_it/version"
require "rspec/expect_it/helpers"
require "rspec/expect_it/expectation_targets/expect_it"
require "rspec/expect_it/expectation_targets/expect_its"

RSpec.configure do |config|
  config.include RSpec::ExpectIt::Helpers
end