require 'cucumber/rails'

# Capybara defaults to considering hidden elements visible, which is not what we want in our tests.
Capybara.ignore_hidden_elements = true

# DatabaseCleaner config
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.allow_remote_database_url = true

# You may also want to configure DatabaseCleaner to use truncation for JavaScript tests
Cucumber::Rails::Database.javascript_strategy = :truncation

# FactoryBot configuration
World(FactoryBot::Syntax::Methods)
