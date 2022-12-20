class TheoryChunk < ApplicationRecord
  belongs_to :lesson, counter_cache: true

  has_many :theory_points
  has_many :exercises
end
