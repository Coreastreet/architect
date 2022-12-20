class RemoveInterestingFactFromTheoryChunk < ActiveRecord::Migration[7.0]
  def change
    remove_column :theory_chunks, :interesting_fact, :string
  end
end
