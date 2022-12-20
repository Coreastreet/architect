class AddObjectivesToLesson < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :objectives, :string, array: true, default: []
  end
end
