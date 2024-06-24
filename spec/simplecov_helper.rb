require 'simplecov'
require 'shields_badge'

SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/' # Excluye la carpeta spec de la cobertura

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::ShieldsBadge
  ])
end

puts "required simplecov"
