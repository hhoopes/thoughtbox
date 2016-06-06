require "simplecov"
require 'capybara-webkit'
SimpleCov.start("rails")

RSpec.configure do |config|
  Capybara.javascript_driver = :webkit

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  def sign_in(user)
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Login"
  end
end
