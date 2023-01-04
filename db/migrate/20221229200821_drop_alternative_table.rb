class DropAlternativeTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :alternatives
  end
end
