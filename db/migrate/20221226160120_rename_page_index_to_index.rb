class RenamePageIndexToIndex < ActiveRecord::Migration[7.0]
  def change
    rename_column :lesson_pages, :page_index, :index
  end
end
