class RemoveReferencesFromUser < ActiveRecord::Migration[7.0]
    def change
      remove_reference :users, :creator, polymorphic: true
      remove_reference :users, :member, polymorphic: true
    end
end
