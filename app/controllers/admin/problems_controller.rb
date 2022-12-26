class Admin::ProblemsController < ApplicationController
  def show
      @lesson = Lesson.find_by(title: lesson_title_param)
      @lesson_pages = @lesson.lesson_pages
      @problem = @lesson.problem
  end

  private 

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :description, :image, :objectives)
  end

  def subject_title_param
    title = deslug(params[:subject_slug])
  end

  def lesson_title_param
    title = deslug(params[:lesson_slug])
  end  

  def deslug(str)
    if str.present?
      str.gsub("-", " ").capitalize!
    end
  end
end
