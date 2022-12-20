class AddContactToCreator < ActiveRecord::Migration[7.0]
  def change
    add_column :creators, :contact_number, :integer
  end
end
