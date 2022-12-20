class AddAlternativeMetricsToSummary < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :alternative_metrics, :string, array: true, default: []
  end
end
