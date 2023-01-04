class Admin::SummariesController < ApplicationController
  layout "admin"

  def show
      @lesson = Lesson.find_by(title: lesson_title_param)
      @subject = @lesson.subject

      @lesson_pages = LessonPage.find(@lesson.page_id_order)
      @summary = @lesson.summary
      @aftermath_image = @summary.aftermath_image
      @process_diagram = @summary.process_diagram

      @last_lesson_page = LessonPage.find(@lesson.page_id_order[-1])
      @summary_alternatives = @summary.alternatives
  end

  def edit
      @lesson = Lesson.find_by(title: lesson_title_param)

      @summary = @lesson.summary
      @aftermath_image = @summary.aftermath_image
      @process_diagram = @summary.process_diagram
      @summary_alternatives = @summary.alternatives
  end

  def update
      @lesson = Lesson.find_by(title: lesson_title_param)
      @subject = @lesson.subject

      @lesson_pages = @lesson.lesson_pages
      @summary = @lesson.summary

      @summary.update!(summary_params)

      flash[:notice] = 'Summary updated successfully'
      redirect_to admin_lesson_summary_path(@lesson)
  end

  private 

  def lesson_params
      params.require(:lesson).permit(:title, :subtitle, :description, :image, :objectives)
  end

  def subject_title_param
      params[:subject_slug]&.gsub("-", " ")&.capitalize
  end

  def lesson_title_param
      params[:lesson_slug]&.gsub("-", " ")&.capitalize
  end  

  def problem_params
      params.require(:summary).permit(:sources)
  end

  def summary_params
      sum_params = params.require(:summary).permit(:aftermath, :key_points, :sources, :process_diagram, :aftermath_image)
      sum_params[:key_points] = sum_params[:key_points].present? ? JSON.parse(sum_params[:key_points]) : ''
      sum_params[:sources] = sum_params[:sources].present? ? JSON.parse(sum_params[:sources]) : ''
      return sum_params
  end
end
