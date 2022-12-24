class ChangeDefaultForTheoryChunksCount < ActiveRecord::Migration[7.0]
  def change
    change_column :lessons, :theory_chunks_count, :integer, :default => 0
  end
end
