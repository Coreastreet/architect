class RemoveTheoryChunksFromExercises < ActiveRecord::Migration[7.0]
  def change
    remove_reference :exercises, :theory_chunks, null: false, foreign_key: true
  end
end
