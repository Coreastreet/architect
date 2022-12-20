class RemoveAnswerFromLessonObjective < ActiveRecord::Migration[7.0]
  def change
    remove_column :lesson_objectives, :answer, :text
  end
end
