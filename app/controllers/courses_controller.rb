class CoursesController < ApplicationController

  before("/courses") do
    redirect_if_not_logged_in if request.path_info != "/login"
  end

  # GET: /courses
  get "/courses" do
    redirect_if_not_logged_in
    @courses = Course.all
    erb :"/courses/index.html"
  end

  # GET: /courses/new
  get "/courses/new" do
    erb :"/courses/new.html"
  end

  # POST: /courses
  post "/courses" do
    redirect "/courses"
  end

  # GET: /courses/5
  get "/courses/:id" do
    erb :"/courses/show.html"
  end

  # GET: /courses/5/edit
  get "/courses/:id/edit" do
    erb :"/courses/edit.html"
  end

  # PATCH: /courses/5
  patch "/courses/:id" do
    redirect "/courses/:id"
  end

  # DELETE: /courses/5/delete
  delete "/courses/:id/delete" do
    redirect "/courses"
  end
end
