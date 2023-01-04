class Admin::TheoryPointsController < ApplicationController
  def new

  end

  def create
    @page = LessonPage.find(page_params[:lesson_page_id])
    TheoryPoint.create!(title: "Untitled", lesson_page_id: @page.id)

    flash[:notice] = 'New theory point created successfully'
    redirect_to edit_admin_lesson_page_path(@page)
  end

  def destroy
    tp = TheoryPoint.find(theory_point_params[:id])
    @page = tp.lesson_page
    
    tp.destroy!

    flash[:notice] = 'Theory point deleted successfully'
    redirect_to admin_lesson_page_path(@page)
  end

  private 

  def theory_point_params
    params.permit(:id)
  end

  def page_params
    params.permit(:lesson_page_id)
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
