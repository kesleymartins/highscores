require "sinatra"
require "mongoid"
require "require_all"

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

require_all "./src"

run Sinatra::Application