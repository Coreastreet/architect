class AddTitleToProblem < ActiveRecord::Migration[7.0]
  def change
    add_column :problems, :title, :string
  end
end
