class AddSourcesToSummary < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :sources, :string, array: true, default: []
  end
end
