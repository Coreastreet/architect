class AddTheoryChunkToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :theory_chunk, null: false, foreign_key: true
  end
end
