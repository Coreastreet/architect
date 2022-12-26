class AddLessonToLessonPage < ActiveRecord::Migration[7.0]
  def change
    add_reference :lesson_pages, :lesson, null: false, foreign_key: true
  end
end
