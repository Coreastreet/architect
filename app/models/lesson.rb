class Lesson < ApplicationRecord
  belongs_to :subject

  has_one :problem
  has_one :summary

  has_one_attached :image

  has_many :theory_chunks
  has_many :lesson_objectives

  def to_param
    return nil unless persisted?
    self.title.downcase.gsub(' ', '-') # 1-english-for-everyone
  end
end
