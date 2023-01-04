class AddExercisesAndAnswersToLessonsPage < ActiveRecord::Migration[7.0]
  def change
    add_column :lesson_pages, :exercises, :string, array: true, default: []
    add_column :lesson_pages, :answers, :string, array: true, default: []
  end
end
