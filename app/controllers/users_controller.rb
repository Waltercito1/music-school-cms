class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup.html"
  end

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
    @user = User.find_by_id(params[:id])
    @courses = Course.select{ |course| course.instructor_id == session[:user_id]}
    #binding.pry
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
    if user.update(params["user"])
      flash[:success] = "User updated successfully." 
      redirect "/users/#{user.id}"
    else
      flash[:error] = user.errors.full_messages.first
    end
  end

  # DELETE: /users/5
  delete "/users/:id" do
    user = User.find_by_id(params[:id])
    #binding.pry
    if current_user #user.delete
      flash[:success] = "User successfully deleted."
      redirect "/users"
    else
      flash[:error] = "Something went wrong. Please try again."
    end
  end
  
end
