class RemoveDescriptionFromAlternatives < ActiveRecord::Migration[7.0]
  def change
    remove_column :alternatives, :description, :text
  end
end
