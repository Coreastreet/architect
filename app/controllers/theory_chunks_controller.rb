class TheoryChunksController < ApplicationController
  def show
      @page_index = page_index_param[:theory_id].to_i      

      @lesson = Lesson.find_by(title: lesson_title_param)
      @theory_chunk = TheoryChunk.find_by(lesson_id: @lesson.id, page_index: (@page_index - 1) )
      @theory_points = @theory_chunk.theory_points.order(:order_index)
      @exercises = @theory_chunk.exercises
  end

  private

  def subject_title_param
    title = deslug(params[:subject_slug])
  end

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
