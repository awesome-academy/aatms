class CreateTraineeSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :trainee_subjects do |t|
      t.datetime :start_date
      t.datetime :finish_date
      t.references :trainee, foreign_key: true
      t.references :course_subject, foreign_key: true
      t.references :course_trainee, foreign_key: true
      t.references :subject, foreign_key: true
      

      t.timestamps
    end
  end
end
