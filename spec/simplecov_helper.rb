# spec/simplecov_helper.rb
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
end

puts "required simplecov"

require 'shields_badge'
SimpleCov.formatter = SimpleCov::Formatter::ShieldsBadge
