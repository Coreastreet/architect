class SummaryController < ApplicationController
  def show
    @lesson = Lesson.find_by(title: lesson_title_param)
    @lesson_pages = LessonPage.find(@lesson.page_id_order)

    @summary = @lesson.summary
    @aftermath_image = @summary.aftermath_image
    @process_diagram = @summary.process_diagram

    @summary_alternatives = @summary.alternatives
    @last_page_index = @lesson.lesson_pages_count
  end

  private
  
  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :objectives, :process_diagram, :pros, :cons)
  end

  def subject_title_param
    params[:subject_slug]&.gsub("-", " ")&.capitalize
  end

  def lesson_title_param
    params[:lesson_slug]&.gsub("-", " ")&.capitalize
  end  
end
