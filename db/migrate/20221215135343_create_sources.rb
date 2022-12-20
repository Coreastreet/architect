class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources do |t|
      t.string :website_link
      t.integer :quality
      t.text :short_review
      t.references :summary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
