class AddLessonsOnCreators < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :creators, index: true
  end
end
