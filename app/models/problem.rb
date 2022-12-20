class Problem < ApplicationRecord
  belongs_to :lesson

  has_one_attached :image
end
