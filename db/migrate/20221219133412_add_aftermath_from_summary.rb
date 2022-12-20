class AddAftermathFromSummary < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :aftermath, :text
  end
end
