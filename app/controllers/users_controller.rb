class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup.html"
  end

  post "/signup" do
    user = User.create(params["user"])
    if user.valid?
      flash[:success] = "New user created successfully."
      session["user_id"] = user.id
      redirect '/courses'
    else
      flash[:error] = user.errors.full_messages.first
      redirect '/signup'
    end
    
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
    user.update(params["user"])
    binding.pry
    redirect "/users/#{user.id}"
  end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
