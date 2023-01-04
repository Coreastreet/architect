class AddAlternativesCountToSummary < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :alternatives_count, :integer, default: 0
  end
end
