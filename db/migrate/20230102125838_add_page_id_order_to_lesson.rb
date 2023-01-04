class AddPageIdOrderToLesson < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :page_id_order, :integer, array: true, default: []
  end
end
