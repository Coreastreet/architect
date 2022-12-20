class Summary < ApplicationRecord
  has_many :alternatives

  has_one_attached :aftermath_image
  has_one_attached :process_diagram

  belongs_to :lesson
end
