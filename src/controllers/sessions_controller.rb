class SessionsController < ApplicationController
    configure do
        set :views, "src/views/sessions"
    end
    
    get '/sessions/new' do
        slim :new, layout: layout_path('base')
    end

    post '/sessions' do
        user = User.where(username: params[:username]).first
        
        unless user
            flash[:error] = "Username não foi encontrado."
            redirect '/sessions/new'
        end

        if user.password == params[:password]
            session[:user_id] = user.id
            flash[:notice] = "Login realizado com sucesso!"
            redirect '/'
        else
            flash[:error] = "Credenciais Inválidas!"
            redirect '/sessions/new'
        end
    end

    get '/sessions/logout' do
        session.clear
        redirect '/'
    end
end