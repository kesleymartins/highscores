class UsersController < ApplicationController
  configure do
    set :views, "src/views/users"
  end

  get '/users/new' do
    haml :new, layout: layout_path('application')
  end

  post '/users' do
    user = User.new(params)

    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:error] = "Não foi possível criar o usuário"
      redirect '/users/new'
    end
  end
end