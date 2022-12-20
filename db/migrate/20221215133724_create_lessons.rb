class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :creator, null: false, foreign_key: true
      t.integer :subject
      t.string :title
      t.string :subtitle
      t.text :description

      t.timestamps
    end
  end
end
