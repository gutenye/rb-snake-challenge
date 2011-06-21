class SnakeChallenge
	class SnakeInfo < OpenOption

		def initialize data={}
			super
			@data[:body] = SnakeBody.new(data["body"])
		end

	end
end
