require "sinatra"
require "mongoid"
require "require_all"
require 'argon2'
require "sinatra/flash"
require 'haml'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

require_all "./src"

use HighscoresController
use UsersController
use SessionsController

run Sinatra::Application