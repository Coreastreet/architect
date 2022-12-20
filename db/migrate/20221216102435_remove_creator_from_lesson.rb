class RemoveCreatorFromLesson < ActiveRecord::Migration[7.0]
  def change
    remove_reference :lessons, :creators, index: true
  end
end
