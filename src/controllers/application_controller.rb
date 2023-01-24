class ApplicationController < Sinatra::Base
    configure do
        register Sinatra::Flash
        enable :sessions
    end

    def layout_path(name)
        "../layout/#{name}".to_sym
    end

    get '/' do
        redirect '/highscores'
    end
end