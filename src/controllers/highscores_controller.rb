class HighscoresController < ApplicationController
    configure do
        set :views, "src/views/highscores"
    end

    get '/highscores' do
        @highscores = Highscore.all

        haml :index, layout: layout_path('application')
    end
end