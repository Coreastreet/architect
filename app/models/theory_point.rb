class TheoryPoint < ApplicationRecord
  belongs_to :theory_chunk

  has_one_attached :image
end
