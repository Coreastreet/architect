class AddLoginableToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :loginable, polymorphic: true
  end
end
