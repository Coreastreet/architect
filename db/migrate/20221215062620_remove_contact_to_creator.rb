class RemoveContactToCreator < ActiveRecord::Migration[7.0]
  def change
    remove_column :creators, :contact_number, :integer
  end
end
