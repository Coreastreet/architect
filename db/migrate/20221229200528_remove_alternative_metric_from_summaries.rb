class RemoveAlternativeMetricFromSummaries < ActiveRecord::Migration[7.0]
  def change
    remove_column :summaries, :alternative_metrics, :string
  end
end
