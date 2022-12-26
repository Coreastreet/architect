class AddLessonPageToTheoryPoint < ActiveRecord::Migration[7.0]
  def change
    add_reference :theory_points, :lesson_page, null: false, foreign_key: true
  end
end
