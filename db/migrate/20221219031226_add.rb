class Add < ActiveRecord::Migration[7.0]
  def change
    add_reference :theory_points, :theory_chunk, null: false, foreign_key: true
  end
end
