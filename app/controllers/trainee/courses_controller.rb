class Trainee::CoursesController < ApplicationController
  
  def index
    trainee = Trainee.find_by id: current_trainee.id
  	@trainee_courses = trainee.trainee_courses
  end

  def show
  	course_of_trainee = CourseTrainee.find_by trainee_id: current_trainee.id, course_id: params[:id]
    @course = course_of_trainee.course
    @course_subjects = @course.course_subjects
    @trainee_of_courses = @course.trainees
    @trainer_of_courses = @course.trainers
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :image)
  end
end
