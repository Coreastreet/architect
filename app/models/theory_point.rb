class TheoryPoint < ApplicationRecord
  belongs_to :lesson_page

  has_one_attached :image
end
