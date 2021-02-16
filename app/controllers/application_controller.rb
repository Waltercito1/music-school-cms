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

  # error Sinatra::NotFound do
  #   erb :"error.html"
  # end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:error] = "Please login or signup to continue."
        redirect "/login"
      end
    end
  end
end
