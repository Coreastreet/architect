class AddTitleToTheoryChunk < ActiveRecord::Migration[7.0]
  def change
    add_column :theory_chunks, :title, :string
  end
end
