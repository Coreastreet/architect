class DropLessonObjectives < ActiveRecord::Migration[7.0]
  def change
    drop_table :lesson_objectives
  end
end
