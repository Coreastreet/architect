class AddTheoryChunksCountToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :theory_chunks_count, :integer
  end
end
