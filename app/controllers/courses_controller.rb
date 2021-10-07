class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.all
    render json: @courses, include: [:tutors]
  end

  #POST/courses
  def create
    @course = Course.create!(
      name: params[:name],
    )
    if @course.save
      render json: @course
    else
      render error: {error: 'Unable to create Course' }, status:400
    end

  end

  # GET /courses/:id
  def show
    render json: @course
  end

  #PUT/courses/:id
  def update
    @course.update(
      name: params[:name],
    )
    render json: @course
  end

  #DELETE/courses/:id
  def destroy
    @courses = Course.all
    @course = Course.find(params[:id])
    @course.destroy
    render json: @courses
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

end
