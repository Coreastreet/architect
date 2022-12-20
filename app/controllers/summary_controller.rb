class SummaryController < ApplicationController
  def show
    @lesson = Lesson.find_by(title: lesson_title_param)
    @summary = @lesson.summary
    @aftermath_image = @summary.aftermath_image

    @summary_alternatives = @summary.alternatives
    @last_page_index = @lesson.theory_chunks_count
  end

  private

  def lesson_title_param
    title = deslug(params[:lesson_slug])
  end

  def page_index_param
    params.permit(:theory_id)
  end

  def deslug(str)
    if str.present?
      str.gsub("-", " ").downcase
    end
  end
end
