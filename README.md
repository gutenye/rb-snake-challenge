SnakeChallenge, a client API for snake-challenge
===========================================

**Homepage**: [https://github.com/GutenLinux/snake_challenge](https://github.com/GutenLinux/snake_challenge) <br/>
**Snake-Challenge**: [https://bitbucket.org/linjunhalida/snake-challenge](https://bitbucket.org/linjunhalida/snake-challenge/wiki/Home) <br/>
**Author**:	Guten <br/>
**License**: MIT-LICENSE <br/>
**Documentation**: [http://rubydoc.info/gems/snake_challenge/frames](http://rubydoc.info/gems/snake_challenge/frames) <br/>
**Issue Tracker**: [https://github.com/GutenLinux/snake_challenge/issues](https://github.com/GutenLinux/snake_challenge/issues) <br/>

Overview
--------

	see https://bitbucket.org/linjunhalida/snake-challenge/wiki/Home

Usage
-----

	require "snake_challenge"
	game = SnakeChallenge.new "hello", 1
	game.connect
	p game.status
	snake = game.snake
	snake.turn(0) #=> turn left

see API documentation for more information.


Contributing
-------------

* report bugs/featues to issue tracker.
* fork it and pull a request.
* improve documentation.
* feel free to post any ideas. 
	
Install
----------

	gem install snake_challenge

Copyright
---------
Copyright &copy; 2011 by Guten. this library released under MIT-LICENSE, See {file:LICENSE} for futher details.
