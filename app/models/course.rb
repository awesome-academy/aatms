class Course < ApplicationRecord
  after_update_commit :notify
  after_update_commit :build_trainee_subjects, if: :course_training?
  mount_uploader :image, ImageUploader
  has_many :notifications , dependent: :destroy
  has_many :course_trainees, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :course_trainers, dependent: :destroy
  has_many :trainees,  through: :course_trainees
  has_many :subjects,  through: :course_subjects
  has_many :trainers,  through: :course_trainers
  has_many :notifications
  has_many :schedule
  enum status: {start: 0 ,training: 1, finish:2}

  scope :training_course, -> {where status: 1}
  def build_trainee_subjects
      ActiveRecord::Base.transaction do
        self.course_trainees.each do |course_trainee|
          self.course_subjects.each do |course_subject|
            new_trainee_subjects = course_subject.trainee_subjects.build trainee_id: course_trainee.trainee.id, subject_id: course_subject.subject.id , course_trainee_id: course_trainee.id, course_subject_id: course_subject.id
            new_trainee_subjects.save!
          end
        end
      end  
  end

  private
  def notify
    ActiveRecord::Base.transaction do
      new_notification = Notification.create(event: "Course #{self.name} was been #{self.status}" , course_id: self.id)
      self.course_trainees.each do |course_trainee|
        new_notification_statuses = course_trainee.notification_statuses.build( course_trainee_id: course_trainee.id , notification_id: new_notification.id )
        new_notification_statuses.save
      end
    end
  end

  def course_training?
    self.training?
  end
end
