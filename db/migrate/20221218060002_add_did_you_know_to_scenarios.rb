class AddDidYouKnowToScenarios < ActiveRecord::Migration[7.0]
  def change
    add_column :scenarios, :did_you_know, :text
  end
end
