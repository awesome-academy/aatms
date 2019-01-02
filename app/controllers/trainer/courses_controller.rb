class Trainer::CoursesController < ApplicationController
  before_action :find_course
  before_action :find_members_not_in_course , only: [:show]
  def index
    if !params[:q]
      @courses = current_trainer.courses
    else
      @courses = current_trainer.courses.ransack(name_cont: params[:q]).result.limit(5)
      search_param = params[:q]
      @title_search = search_param.present? ? t("search_for", search_param: search_param) : t("all_course")

      respond_to do |format|
        format.html {}
        format.json {
        }
      end
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      redirect_to trainer_course_path(@course)
    else
      redirect_to root_url
    end
  end

  def edit
    redirect_to root_url and return unless @course
  end

  def update
    @course.update_attributes(course_params)
    redirect_to trainer_course_path(@course)
  end

  def show
    redirect_to root_url and return unless @course
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, subject_ids: [])
  end

  def find_course
    @course = Course.find_by id: params[:id]
  end

  def find_members_not_in_course
    @find_trainees = Trainee.trainee_data(@course)
    @find_trainers = Trainer.trainer_data(@course)
  end
end
