class RemoveMiniGoalFromLessonPages < ActiveRecord::Migration[7.0]
  def change
    remove_column :lesson_pages, :mini_goal, :string
  end
end
