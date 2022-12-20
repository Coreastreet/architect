class CreateScenarios < ActiveRecord::Migration[7.0]
  def change
    create_table :scenarios do |t|
      t.string :question
      t.text :description
      t.string :image_subtitle
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
