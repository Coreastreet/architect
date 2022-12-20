class AddOrderIndexToTheoryPoint < ActiveRecord::Migration[7.0]
  def change
    add_column :theory_points, :order_index, :integer
  end
end
