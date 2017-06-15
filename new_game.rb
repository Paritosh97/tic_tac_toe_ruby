require_relative 'game.rb'

puts "Enter player names : \nPlayer 1 : "
p1 = gets.chomp
puts "Player 2 : "
p2 = gets.chomp

new_game = Game.new(p1, p2)

new_game.start_game
