class AddLessonPageToExercise < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :lesson_page, null: false, foreign_key: true
  end
end
