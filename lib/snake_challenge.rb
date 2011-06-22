require 'tagen/core'
require "json"
require "net/http"

class SnakeChallenge
	Error = Class.new Exception
	NoPlaceForNewSnake = Class.new Error

	# the room number
	attr_reader :room

	# the type of the snake
	attr_reader :type

	# the name of the snake
	attr_reader :name

	# my snake idx in snakes. 
	attr_reader :seq

	# id for api request
	attr_reader :id

	# map info. 
	# @param [Map] map
	attr_reader :map

	# my snake. 
	# @param [Snake] snake
	attr_reader :snake

	# all snakes infomation. 
	# @param [Array<SnakeInfo>] snakes
	attr_reader :snakes

	# the other snakes information.
	attr_reader :other_snakes

	# gems positions
	# @param [Array] gems \[ [x,y] ]
	attr_reader :gems

	# eggs positions
	# @params [Array] eggs \[ [x,y] ]
	attr_reader :eggs

	# current game round
	attr_reader :round

	# game server status
	attr_reader :status

	# api for send request
	attr_reader :http

	# create a new snake game
	#
	# @param [String] name the name of the snake
	# @param [Fixnum] room room number
	# @param [Symbol] type :ruby :python
	def initialize name
		@name = name
	end


	def connect server, port
		@http = Net::HTTP.new(server, port)
	end

	def join room, type=:ruby
		@room = room
		@type = type

		request = Net::HTTP::Post.new("/room/#{@room}/add")
		request.set_form_data(:name => @name, :type => @type)
		response = @http.request(request)
		me, info = JSON.parse(response.body)

		if status=me["status"]
			case status
			when /snake type error/
				raise Error, status
			when /no place ... new snake/
				raise NoPlaceForNewSnake
			end
		end

		@id = me["id"]
		@seq = me["seq"]
		convert_info info
		@snake = Snake.new(self)
		@map = get_map


	end

	private

	# API only. please use Snake#turn
	# @param [Fixnum] direction
	def turn direction
		request = Net::HTTP::Post.new("/room/#{room}/turn")
		request.set_form_data(:id => id, :round => round, :direction => direction)
		response = @http.request(request)
		result, info = JSON.parse(response.body)

		#raise Error, status unless status=="ok"
		convert_info info
	end

	def convert_info info
		@gems = info["gems"]
		@status = info["status"]
		@eggs = info["eggs"]
		@round = info["round"]
		@snakes = info["snakes"].map{|v| SnakeInfo.new(v)}
		@other_snakes = @snakes.clone.tap{|v|v.delete_at(seq)}
	end
	
	def get_map
		respond = @http.get("/room/#{@room}/map")
		data = JSON.parse(respond.body)
		#Map.new(data["walls"], data["size"])
		data
	end
end

%w(
	snake
	snake_info

	points
	map
	snake_body
).each {|n| require_relative "snake_challenge/#{n}"}
