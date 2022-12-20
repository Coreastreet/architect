class RemoveRecapFromSummary < ActiveRecord::Migration[7.0]
  def change
    remove_column :summaries, :recap, :text
  end
end
