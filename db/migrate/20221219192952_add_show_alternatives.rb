class AddShowAlternatives < ActiveRecord::Migration[7.0]
  def change
    add_column :summaries, :show_alternatives, :boolean, default: false
  end
end
