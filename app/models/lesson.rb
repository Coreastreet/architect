class Lesson < ApplicationRecord
  after_create :createInitialPages
  after_create :addIdToSubject

  after_destroy :removeIdFromSubject

  belongs_to :subject

  has_one :problem, dependent: :destroy
  has_one :summary, dependent: :destroy

  has_one_attached :image

  has_many :lesson_pages, dependent: :destroy

  def to_param
    return nil unless persisted?
    self.title.downcase.gsub(' ', '-') # 1-english-for-everyone
  end

  def createInitialPages
      self.create_problem!(title: "Untitled Problem")
      self.create_summary!(aftermath: "Empty Aftermath Description")
      page = self.lesson_pages.create!(title: "Untitled Page")
      self.update!(page_id_order: [page.id])
  end

  def addIdToSubject
      self.subject.addLessonId(self.id)
  end

  def removeIdFromSubject
      self.subject.removeLessonId(self.id)
  end
end
