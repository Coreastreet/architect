class DropCreatorAndMembers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :lessons, :creator, index: true

    drop_table :creators
    drop_table :members
  end
end
