class HighscoresController < ApplicationController
    helpers Sinatra::ContentFor

    configure do
        set :views, "src/views/highscores"
    end

    get '/highscores' do
        @highscores = Highscore.all

        slim :index, layout: layout_path('base')
    end
end