class CreateTestAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :test_answers do |t|
      t.references :test_question, foreign_key: true
      t.string :answer
      t.integer :status

      t.timestamps
    end
  end
end
