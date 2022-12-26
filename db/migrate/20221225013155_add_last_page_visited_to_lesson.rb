class AddLastPageVisitedToLesson < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :last_page_visited, :integer, default: 0
  end
end
