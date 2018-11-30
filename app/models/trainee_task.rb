class TraineeTask < ApplicationRecord
  after_update_commit :notify
  belongs_to :trainee
  belongs_to :task
  belongs_to :course_subject_task
  belongs_to :trainee_subject
  enum status: {pending: 0 ,finish: 1}

  private
  def notify
    ActiveRecord::Base.transaction do
      new_notification = Notification.create(event: "#{self.trainee.name} #{self.status} task #{self.task.name}" , course_id: self.trainee_subject.course_trainee.course.id)
      self.trainee_subject.course_trainee.course.course_trainees.each do |course_trainee|
        new_notification_statuses = course_trainee.notification_statuses.build( course_trainee_id: course_trainee.id , notification_id: new_notification.id )
        new_notification_statuses.save
      end
    end
  end
end
