class RemoveSubjectFromLesson < ActiveRecord::Migration[7.0]
  def change
    remove_column :lessons, :subject, :string
  end
end
