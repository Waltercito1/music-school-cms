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
    binding.pry
    #course = Course.create(params["course"])
    redirect "/courses"
  end

  # GET: /courses/5
  get "/courses/:id" do
    @course = Course.find(params[:id])
    erb :"/courses/show.html"
  end

  # GET: /courses/5/edit
  get "/courses/:id/edit" do
    @course = Course.find(params[:id])
    erb :"/courses/edit.html"
  end

  # PATCH: /courses/5
  patch "/courses/:id" do
    course = Course.find_by_id(params[:id])
    if course.update(params["course"])
      flash[:success] = "Course updated successfully."
      redirect "/courses/#{course.id}"
    else
      flash[:error] = course.errors.full_messages.first
    end
  end

  # DELETE: /courses/5
  delete "/courses/:id" do
    course = Course.find_by_id(params[:id])
    #binding.pry
    if current_user #course.delete
      flash[:success] = "Course successfully deleted."
      redirect "/courses"
    else
      flash[:error] = "Something went wrong. Please try again."
    end
  end
  
end
