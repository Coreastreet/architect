class LessonPagesController < ApplicationController
  def show
      @page_index = page_index_param[:lesson_page_id].to_i      

      @lesson = Lesson.find_by(title: lesson_title_param)
      @page = LessonPage.find(@lesson.page_id_order[(@page_index - 1)])
      @theory_points = @page.theory_points.order(:order_index)
      @exercises = @page.exercises

      @subject = @lesson.subject
      @lesson_pages = LessonPage.find(@lesson.page_id_order)
      @problem = @lesson.problem
      @summary = @lesson.summary

      @current_page = "page_#{@page.id}"
  end

  private

  def subject_title_param
    title = deslug(params[:subject_slug])
  end

  def lesson_title_param
    title = deslug(params[:lesson_slug])
    title.capitalize
  end

  def page_index_param
    params.permit(:lesson_page_id)
  end

  def deslug(str)
    if str.present?
      str.gsub("-", " ").downcase
    end
  end

end
