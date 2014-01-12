require "./classes/holocaust"
require 'snooby'
require 'YAML'

puts "Username:"
username = gets.chomp

puts "Password:"
password = gets.chomp

Holocaust.new(username, password)
