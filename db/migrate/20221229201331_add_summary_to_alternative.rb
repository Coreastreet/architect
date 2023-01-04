class AddSummaryToAlternative < ActiveRecord::Migration[7.0]
  def change
    add_reference :alternatives, :summary, null: false, foreign_key: true
  end
end
