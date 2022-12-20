class AddSimonSaysToScenarios < ActiveRecord::Migration[7.0]
  def change
    add_column :scenarios, :simon_says, :text
  end
end
