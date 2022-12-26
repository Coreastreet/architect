class RemoveTheoryChunkFromExercise < ActiveRecord::Migration[7.0]
  def change
    remove_reference :exercises, :theory_chunk, null: false, foreign_key: true
  end
end
