class UsersController < ApplicationController
    configure do
        set :views, "src/views/users"
    end

    get '/users/new' do
        slim :new, layout: layout_path('base')
    end

    post '/users' do
    end
end