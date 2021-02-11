class SessionsController < ApplicationController

  get "/login" do
    redirect "/" if logged_in?
    erb :"/sessions/login.html"
  end

  post "/login" do
    user = User.find_by_email_address(params["user"]["email_address"])
    if user && user.authenticate(params["user"]["password"])
      session["user_id"] = user.id
      flash[:success] = "Success!"
      redirect '/'
    else
      flash[:error] = "Invalid credentials"
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
