class Admin::AlternativesController < ApplicationController
  def new
      @summary = Summary.find(params[:summary_id])
      @new_alternative = Alternative.new
  end

  def create
      @alternative = Alternative.create!(alternative_params)
      @lesson = @alternative.summary.lesson

      redirect_to admin_lesson_summary_path(@lesson)
  end

  def update
  end

  def destroy
      alternative = Alternative.find(params[:id])
      @lesson = alternative.summary.lesson
      alternative.destroy!

      redirect_to admin_lesson_summary_path(@lesson)
  end

  private

  def alternative_params
      params.require(:alternative).permit(:title, :description, :pros, :cons, :summary_id)
  end
end
