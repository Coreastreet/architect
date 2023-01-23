class Subject < ApplicationRecord
    belongs_to :creator
    has_many :lessons

    has_one_attached :image

    def to_param
        return nil unless persisted?
        self.title.downcase.gsub(' ', '-') # 1-english-for-everyone
    end

    def addLessonId(num)
        new_order = self.lesson_id_order.unshift(num)
        self.update!(lesson_id_order: new_order)
    end

    def removeLessonId(num)
        new_order = self.lesson_id_order - [num]
        self.update(lesson_id_order: new_order)
    end
end
