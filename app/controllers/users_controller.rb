class UsersController < ApplicationController

  #GET: /signup
  get "/signup" do
    erb :"/users/signup.html"
  end

  #POST: /signup
  post "/signup" do
    user = User.create(params["user"])
    if user.valid?
      flash[:success] = "New user created successfully."
      session["user_id"] = user.id
      redirect "/users/#{user.id}"
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
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    if logged_in?
      @user = User.find_by_id(params[:id])
      if current_user && @user.id == current_user.id
        erb :"/users/edit.html"
      else
        flash[:error] = "You do not have permissions to edit this user."
          redirect "/users/#{@user.id}"
      end
    else
      flash[:error] = "You must be logged in to edit a user's information."
      redirect "/login"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    user = User.find_by_id(params[:id])
    if current_user.id == user.id
      user.update(params["user"])
      flash[:success] = "User updated successfully." 
      redirect "/users/#{user.id}"
    else
      flash[:error] = "You do not have permissions to update this user."
      redirect "/users/#{user.id}"
    end
  end

  # DELETE: /users/5
  delete "/users/:id" do
    user = User.find_by_id(params[:id])
    if current_user.id == user.id
      user.delete
      flash[:success] = "User successfully deleted."
      redirect "/users"
    else
      flash[:error] = "You do not have permissions to delete this user."
      redirect "/users/#{user.id}"
    end
  end
  
end
