class RemoveQuestionFromProblems < ActiveRecord::Migration[7.0]
  def change
    remove_column :problems, :question, :string
  end
end
