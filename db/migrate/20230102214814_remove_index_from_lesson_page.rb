class RemoveIndexFromLessonPage < ActiveRecord::Migration[7.0]
  def change
    remove_column :lesson_pages, :index, :integer
  end
end
