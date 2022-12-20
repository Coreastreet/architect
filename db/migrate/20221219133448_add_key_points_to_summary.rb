class AddKeyPointsToSummary < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :key_points, :string, array: true, default: []
  end
end
