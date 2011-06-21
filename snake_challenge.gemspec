$: << "."
require "version"

Gem::Specification.new do |s|
	s.name = "snake_challenge"
	s.version = SnakeChallenge::VERSION::IS
	s.summary = "a lib for RubyVSPython game"
	s.description = <<-EOF
a good lib
	EOF

	s.author = "Guten"
	s.email = "ywzhaifei@Gmail.com"
	#s.homepage = "http://github.com/GutenYe/snake_challenge"
	s.rubyforge_project = "xx"

	s.files = `git ls-files`.split("\n")

	s.add_dependency 'tagen', '~>1.0.0'
	s.add_dependency 'o', '~>1.0.0'
end
