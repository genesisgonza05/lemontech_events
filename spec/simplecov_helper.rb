require 'simplecov'
require 'simplecov-badge'

SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
end

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::BadgeFormatter
])

if ENV['CI']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end
