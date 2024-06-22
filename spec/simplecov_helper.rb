# spec/simplecov_helper.rb
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
end

SimpleCov.coverage_dir 'coverage/rspec' # Puedes personalizar la carpeta de salida si lo deseas

puts "SimpleCov started"