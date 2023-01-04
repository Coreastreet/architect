class Admin::ProblemsController < ApplicationController
  layout "admin"

  def show
      @lesson = Lesson.find_by(title: lesson_title_param)
      @subject = @lesson.subject

      @lesson_pages = LessonPage.find(@lesson.page_id_order)
      @problem = @lesson.problem
      @problem_image = @problem.image

      @first_lesson_page = LessonPage.find(@lesson.page_id_order[0])
  end

  def edit
      @lesson = Lesson.find_by(title: lesson_title_param)
      @problem = @lesson.problem
      @problem_image = @problem.image
  end

  def update
      @lesson = Lesson.find_by(title: lesson_title_param)
      @subject = @lesson.subject

      @lesson_pages = @lesson.lesson_pages
      @problem = @lesson.problem
      @problem.update!(problem_params)

      @problem_image = @problem.image

      @first_lesson_page = LessonPage.find(@lesson.page_id_order[0])

      flash[:notice] = 'Problem updated successfully'
      redirect_to admin_lesson_problem_path(@lesson)
  end 

  private 

  def problem_params
    params.require(:problem).permit(:title, :image_subtitle, :description, :simon_says, :did_you_know, :image)
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :description, :image, :objectives)
  end

  def lesson_id_params
    params.permit(:id)
  end

  def subject_title_param
    params[:subject_slug]&.gsub("-", " ")&.capitalize
  end

  def lesson_title_param
    params[:lesson_slug]&.gsub("-", " ")&.capitalize
  end  
end
