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
    if current_user
      erb :"/courses/new.html"
    else
      redirect "/login"
    end
  end

  # POST: /courses
  post "/courses" do
    if current_user
      course = current_user.courses.create(params["course"])
      if course.valid?
      flash[:success] = "Course successfully created."
      redirect "/courses/#{course.id}"
      else
        flash[:error] = course.errors.full_messages.first
        redirect "/courses/new"
      end
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect "/courses/new"
    end
  end

  # GET: /courses/5
  get "/courses/:id" do
    redirect_if_not_logged_in
    #binding.pry
    if Course.all.ids.to_s.include?(params[:id]) #Course.all.include?(params[:id])
      @course = Course.find(params[:id])
      erb :"/courses/show.html"
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect "/courses"
    end
  end

  # GET: /courses/5/edit
  get "/courses/:id/edit" do
    if logged_in?
      @course = Course.find(params[:id])
      if @course.user != nil && current_user && @course.user.id == current_user.id
        erb :"/courses/edit.html"
      else
        flash[:error] = "You do not have permission to update this course."
        redirect "/courses/#{@course.id}"
      end
    else
      flash[:error] = "You must be logged in to edit a course."
      redirect "/login"
    end
  end

  # PATCH: /courses/5
  patch "/courses/:id" do
    course = Course.find_by_id(params[:id])
    if current_user && course.user.id == current_user.id
      course.update(params["course"])
      flash[:success] = "Course updated successfully."
      redirect "/courses/#{course.id}"
    else
      flash[:error] = "You do not have permissions to update this course."
      redirect "/courses/#{course.id}"
    end
  end

  # DELETE: /courses/5
  delete "/courses/:id" do
    course = Course.find_by_id(params[:id])
    if current_user && course.user.id == current_user.id
      course.delete
      flash[:success] = "Course successfully deleted."
      redirect "/courses"
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect "/courses/#{course.id}"
    end
  end
end
