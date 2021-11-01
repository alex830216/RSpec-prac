RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before do
    FactoryBot.reload
  end
end