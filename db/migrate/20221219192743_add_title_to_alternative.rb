class AddTitleToAlternative < ActiveRecord::Migration[7.0]
  def change
    add_column :alternatives, :title, :string
  end
end
