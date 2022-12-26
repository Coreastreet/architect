class RenameTheoryChunksCountToLessonPagesCount < ActiveRecord::Migration[7.0]
  def change
    rename_column :lessons, :theory_chunks_count, :lesson_pages_count
  end
end
