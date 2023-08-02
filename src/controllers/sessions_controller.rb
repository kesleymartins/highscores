class SessionsController < ApplicationController
  configure do
    set :views, "src/views/sessions"
  end

  get '/sessions/new' do
    haml :new, layout: layout_path('application')
  end

  post '/sessions' do
    credential = Credential.new(params)

    if credential.invalid?
      flash[:error] = "Credenciais inválidas!"
      redirect '/sessions/new'
    end

    user = User.where(username: params[:username]).first

    if user.authenticate(params[:password])
      session[:user_id] = user.id
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