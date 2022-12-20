class DropSources < ActiveRecord::Migration[7.0]
  def change
    drop_table :sources
  end
end
