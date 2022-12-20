class Subject < ApplicationRecord
    belongs_to :creator
    has_many :lessons

    has_one_attached :profile_picture
end
