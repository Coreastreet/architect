class CreateSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :summaries do |t|
      t.text :recap
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
