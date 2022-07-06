require 'factory_bot'

# RSpec without Rails
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
    FactoryBot.define do
      initialize_with { new(**attributes) }
    end
  end
end