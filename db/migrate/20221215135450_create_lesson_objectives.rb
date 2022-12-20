class CreateLessonObjectives < ActiveRecord::Migration[7.0]
  def change
    create_table :lesson_objectives do |t|
      t.string :objective
      t.boolean :main
      t.text :answer
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
