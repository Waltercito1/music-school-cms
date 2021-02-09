require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  get ['/signin', '/access'] do
    redirect '/login'
  end

  error Sinatra::NotFound do
    erb :"error.html"
  end

end
