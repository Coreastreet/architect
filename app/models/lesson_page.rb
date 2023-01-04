class LessonPage < ApplicationRecord
  belongs_to :lesson, counter_cache: true

  has_many :theory_points
  accepts_nested_attributes_for :theory_points

end
