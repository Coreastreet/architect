class AddDescriptionToAlternatives < ActiveRecord::Migration[7.0]
  def change
    add_column :alternatives, :description, :text
  end
end
