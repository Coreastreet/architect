class AddSubjectToLessons < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :subject, null: false, foreign_key: true
  end
end
