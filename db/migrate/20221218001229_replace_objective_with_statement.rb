class ReplaceObjectiveWithStatement < ActiveRecord::Migration[7.0]
  def change
    rename_column :lesson_objectives, :objective, :statement
  end
end
