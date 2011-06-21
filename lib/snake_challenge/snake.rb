class SnakeChallenge
	class Snake
		def initialize game
			@game = game
		end

		# body[0]
		# @return [Array] head
		def head
			body[0]
		end

		# turn right. use direction+1
		def right 
			turn direction+1
		end

		# turn left. use direction-1
		def left
			turn direction-1
		end

		# move forward. use direction
		def forward
			turn direction
		end

		# 0 to 3 is left, top, right, bottom
		#
		# @param [Fixnum] direction 
		def turn direction
			@game.__send__ :turn, direction
		end

		def body() SnakeBody.new(info["body"]) end

		def direction() info["direction"] end

		def name() info["name"] end

		def type() info["type"] end

		def length() info["length"] end

		def alive?() info["alive"] end

		private
		def info
			@game.snakes[@game.seq]
		end

	end
end

