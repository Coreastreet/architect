class RenameTheoryChunksToLessonPages < ActiveRecord::Migration[7.0]
  def change
    rename_table :theory_chunks, :lesson_pages
  end
end
