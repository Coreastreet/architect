class Alternative < ApplicationRecord
  belongs_to :summary

  has_one_attached :image
end
