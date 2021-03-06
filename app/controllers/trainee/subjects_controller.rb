class Trainee::SubjectsController < ApplicationController
  def show
    course = Course.find params[:course_id]
    current_course = CourseTrainee.find_by course_id: course.id, trainee_id: current_trainee.id
    redirect_to root_url and return unless current_course
    @current_subject = TraineeSubject.find_by course_trainee_id: current_course.id , subject_id: params[:id]
    redirect_to root_url and return unless @current_subject
    @tasks_of_subject = @current_subject.trainee_tasks
    @finish_tasks = @tasks_of_subject.select{|f| f.status== "finish"}
  end

  def update
    # current_course = CourseTrainee.find(params[:course_id])
    # @current_subject = TraineeSubject.find_by course_trainee_id: current_course.id , subject_id: params[:id]
    # @tasks_of_subject = @current_subject.trainee_tasks
    # @trainee_task = @tasks_of_subject.find_by id: params[:format]
    # if @trainee_task.finish?
    #   @trainee_task.pending!
    # else
    #   @trainee_task.finish!
    # end
    # redirect_to trainee_course_subject_path(current_course , @current_subject.subject)
    respond_to do |format|
      task = TraineeTask.checked_task(params[:trainee_task_ids])
      task.update_status
      format.html { redirect_to trainee_course_subject_path }
    end
  end
end
