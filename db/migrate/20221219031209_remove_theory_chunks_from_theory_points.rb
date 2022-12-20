class RemoveTheoryChunksFromTheoryPoints < ActiveRecord::Migration[7.0]
  def change
    remove_reference :theory_points, :theory_chunks, null: false, foreign_key: true
  end
end
