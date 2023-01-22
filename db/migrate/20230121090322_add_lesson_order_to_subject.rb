class AddLessonOrderToSubject < ActiveRecord::Migration[7.0]
  def change
    add_column :subjects, :lesson_id_order, :integer, array: true, default: []
  end
end
