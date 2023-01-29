class ProblemController < ApplicationController
  def show
    @lesson = Lesson.find_by(title: lesson_title_param)
    @problem = @lesson.problem
    @summary = @lesson.summary

    @lesson_pages = LessonPage.find(@lesson.page_id_order)
    @subject = @lesson.subject
    @current_page = "problem"

    @image = @problem.image
  end

  private 

  def lesson_title_param
    title = deslug(params[:lesson_slug])
  end

  def deslug(str)
    if str.present?
      str.gsub("-", " ").capitalize
    end
  end

end
