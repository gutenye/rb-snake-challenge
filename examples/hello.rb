#!/usr/bin/env ruby
require_relative '../lib/snake_challenge'

#SnakeChallenge::Rc.server =  ['localhost', 4567]

# join the game
puts "connect to the server..."
game = SnakeChallenge.new "guten", 2
game.connect

# get info
snake = game.snake
map = game.map

puts "start the game"
while true
	snake.forward
	puts "current head: #{snake.head.inspect}"
	sleep 0.7
end
