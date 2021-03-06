class Task < ApplicationRecord
  belongs_to :subject
  has_one	 :course_subject_tasks, dependent: :destroy
  has_many   :trainee_tasks, dependent: :destroy
  has_many   :trainees, through: :trainee_tasks
end
