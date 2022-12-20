class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :description
      t.text :solution
      t.references :theory_chunks, null: false, foreign_key: true

      t.timestamps
    end
  end
end
