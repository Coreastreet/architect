class RemoveSavedFromAlternatives < ActiveRecord::Migration[7.0]
  def change
    remove_column :alternatives, :money_saved, :string
    remove_column :alternatives, :time_saved, :string
  end
end
