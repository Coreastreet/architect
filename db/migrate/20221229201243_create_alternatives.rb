class CreateAlternatives < ActiveRecord::Migration[7.0]
  def change
    create_table :alternatives do |t|
      t.string :title
      t.integer :time_saved
      t.integer :money_saved
      t.text :description
      t.string :use_case

      t.timestamps
    end
  end
end
