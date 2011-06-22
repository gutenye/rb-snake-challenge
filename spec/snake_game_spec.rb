require "spec_helper"

describe SnakeGame do
	before :all do
		@game = SnakeGame.connect "rspec"
		@snake = @game.snake
	end

	it "#room" do 
		@game.room.should == 0
	end

	it "#name" do
		@game.name.should == "rspec"
	end

	it "#map" do
		@game.map.should be_an_instance_of SnakeGame::Map
	end

	it "#snake" do
		@game.snake.should be_an_instance_of SnakeGame::Snake 
	end

	it "#snakes" do
		@game.snakes.should be_an_instance_of Array
	end

	it "#gems" do
		@game.gems.should be_an_instance_of Array
	end

	it "#round" do
		@game.round.should be_an_instance_of Fixnum
	end

	it "#status" do
		@game.status.should be_an_instance_of String
	end

	it "#turn" do
		dir = @snake.direction 
		@game.turn dir-1
		@snake.direction.should == dir-1
	end

end

