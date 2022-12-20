class CreateTheoryChunks < ActiveRecord::Migration[7.0]
  def change
    create_table :theory_chunks do |t|
      t.string :mini_goal
      t.string :interesting_fact
      t.integer :page_index
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
