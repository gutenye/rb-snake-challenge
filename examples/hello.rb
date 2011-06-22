#!/usr/bin/env ruby
require_relative '../lib/snake_challenge'

# join the game
puts "connect to the server..."
game = SnakeChallenge.new "guten"
game.connect 'localhost', 4567
#game.connect 'pythonvsruby.org', 80
game.join 1

# get info
snake = game.snake
map = game.map

puts "start the game"
while true
	snake.turn snake.direction
	puts "current head: #{snake.head.inspect}"
	sleep 0.7
end
