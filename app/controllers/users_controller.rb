class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup.html"
  end

  post "/signup" do
    user = User.create(params["user"])
    if user.valid?
      binding.pry
      flash[:success] = "New user created successfully."
      session["user_id"] = user.id
      redirect '/courses'
    else
      flash[:error] = user.errors.full_messages.first
      redirect '/signup'
    end
    
  end

  #GET: /users
  get "/users" do
    redirect_if_not_logged_in
    @users = User.all
    erb :"/users/index.html"
  end

  #GET: /users/5
  get "/users/:id" do
    @user = User.find_by_id(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = User.find_by_id(params[:id])
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    user = User.find_by_id(params[:id])
    # user.update(user_name: params["user"]["user_name"], email_address: params["user"]["email_address"], bio: params["user"]["bio"] )
    user.update(params["user"])
    # if user.update(user_name: params["user"]["user_name"], email_address: params["user"]["email_address"], bio: params["user"]["bio"] )
    #   redirect "/users/#{user.id}"
    # else
      binding.pry
    # end
  end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
