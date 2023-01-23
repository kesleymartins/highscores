class ApplicationController < Sinatra::Base
    def layout_path(name)
        "../layout/#{name}".to_sym
    end

    get '/' do
        redirect '/highscores'
    end
end