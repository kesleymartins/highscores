require "sinatra"
require "mongoid"
require "sinatra/content_for"
require "require_all"

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

require_all "./src"

use HighscoresController

run Sinatra::Application