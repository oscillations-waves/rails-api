class TutorsController < ApplicationController
  before_action :set_course
  before_action :set_course_tutor, only: [:show, :update, :destroy]
  # GET /courses/:course_id/tutors
  def index
    render json: @course.tutors
  end

  # GET /courses/:course_id/tutors/:id
  def show
    render json: @tutor
  end

  # POST /courses/:course_item/tutors
   def create
     @course.tutors.create!(
      tutor_name: params[:tutor_name],
      )
     render json: @course
    # if @tutor.save
    #   render json: @course
    # else
    #   render error: {error: 'Unable to create Course' }, status:400
    # end
  end

  # PUT /courses/:course_id/tutors/:id
  def update
    @tutor.update(
      tutor_name: params[:tutor_name],
      )
    render json: @tutor
  end

  # DELETE /courses/:course_id/tutors/:id
  def destroy
    if @tutor.nil?
      render error: {error: 'Tutor record does not exist' }, status:400
    else
      @tutor.destroy
      head :no_content
    end

  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_course_tutor
    begin
    @tutor = @course.tutors.find_by!(id: params[:id]) if @course
    rescue ActiveRecord::RecordNotFound => e
      @tutor = nil
    end
  end
  end
