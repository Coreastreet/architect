class LessonsController < ApplicationController
  def index
  end

  def index_by_subject
    subject = Subject.find_by(title: subject_title_param)
    @lessons = Lesson.find(subject.lesson_id_order)
  end

  def show
    # identify which lesson is being asked for based on the slug.
    @lesson = Lesson.find_by(title: lesson_title_param)
    @image = @lesson.image
  end

  private

  def subject_title_param
    title = deslug(params[:subject_slug])
  end

  def lesson_title_param
    title = deslug(params[:lesson_slug])
  end

  def deslug(str)
    if str.present?
      str.gsub("-", " ").capitalize
    end
  end


end
