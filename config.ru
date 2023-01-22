require "sinatra"
require "mongoid"
require "require_all"
require "shield"

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

require_all "./src"

use HighscoresController
use UsersController

run Sinatra::Application