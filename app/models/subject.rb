class Subject < ApplicationRecord
    belongs_to :creator
    has_many :lessons

    has_one_attached :image

    def to_param
        return nil unless persisted?
        self.title.downcase.gsub(' ', '-') # 1-english-for-everyone
    end
end
