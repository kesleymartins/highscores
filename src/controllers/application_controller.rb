class ApplicationController < Sinatra::Base
  configure do
    register Sinatra::Flash
    enable :sessions
    set :haml, { escape_html: false }
  end

  before do
    @current_user = User.where(id: session[:user_id]).first
  end

  def layout_path(name)
    "../layout/#{name}".to_sym
  end

  get '/' do
    redirect '/highscores'
  end
end