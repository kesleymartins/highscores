class UsersController < ApplicationController
    configure do
        set :views, "src/views/users"
    end

    get '/users/new' do
        haml :new, layout: layout_path('application')
    end

    post '/users' do
        user = User.new(username: params[:username])
        user.password = params[:password]

        if user.save
            session[:user_id] = user.id
            redirect '/'
        else
            flash[:error] = user.errors.full_messages
            redirect '/users/new'
        end
    end
end