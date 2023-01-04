class AddProsConsToAlternatives < ActiveRecord::Migration[7.0]
  def change
    add_column :alternatives, :pros, :text
    add_column :alternatives, :cons, :text
  end
end
