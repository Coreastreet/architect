class Admin::LessonPagesController < ApplicationController
  layout "admin"

  def show
    @page = LessonPage.find(params[:lesson_page_id])
    @page_theory_points = @page.theory_points
    @page_exercises = @page.exercises

    @lesson = @page.lesson
    @subject = @lesson.subject

    @lesson_pages = LessonPage.find(@lesson.page_id_order)

    page_order = @lesson.page_id_order
    page_index = page_order.index(@page.id)

    @prev_lesson_page = (page_index == 0) ? nil : LessonPage.find(page_order[page_index - 1])
    @next_lesson_page = (page_order[page_index + 1]).present? ? LessonPage.find(page_order[page_index + 1]) : nil
  end

  def new
  end

  def index
  end

  def create
    lesson = Lesson.find_by(title: lesson_title_param)
    @page = LessonPage.create!(lesson_id: lesson.id, title: "Untitled")
    lesson.update!(page_id_order: lesson.page_id_order.unshift(@page.id))
    
    redirect_to admin_lesson_page_path(@page)
  end

  def edit
    @page = LessonPage.find(page_params[:lesson_page_id])
    @page_theory_points = @page.theory_points
    @page_exercises = @page.exercises

    @lesson = @page.lesson
    @subject = @lesson.subject

    @lesson_pages = @lesson.lesson_pages

    #page_order = @lesson.page_id_order
    #page_index = page_order.index(@page.id)

    #@prev_lesson_page = (page_index == 0) ? nil : LessonPage.find(page_order[page_index - 1])
    #@next_lesson_page = (page_order[page_index + 1]).present? ? LessonPage.find(page_order[page_index + 1]) : nil
  end

  def update
    @page = LessonPage.find(page_params[:lesson_page_id])
    @lesson = @page.lesson
    @subject = @lesson.subject

    @lesson_pages = @lesson.lesson_pages.order(:index)

    @page.update!(page_update_params)

    # if the new index does not point to the same page id
    # which will be in the case when the index id has been recently updated.
    index_arr = @lesson.page_id_order
    new_index = page_index_params[:index].to_i
    if (index_arr[new_index] != @page.id)
      index_arr.delete(@page.id)
      index_arr.insert(new_index, @page.id)
      @lesson.update(page_id_order: index_arr)
    end

    flash[:notice] = 'Lesson Page updated successfully'
    redirect_to admin_lesson_page_path(@page)
  end

  def destroy
    @page = LessonPage.find(page_params[:lesson_page_id])
    @lesson = @page.lesson

    page_order = @lesson.page_id_order
    page_order.delete(@page.id)

    @lesson.update!(page_id_order: page_order)
    @page.destroy!

    flash[:notice] = 'Lesson deleted successfully'
    redirect_to admin_lesson_problem_path(@lesson)
  end

  private 

  def page_params
    params.permit(:lesson_page_id)
  end

  def page_update_params
    update_params =  params.require(:lesson_page).permit(:title, :exercises, :answers, :theory_points_attributes => [:id, :title, :description, :lesson_page_id, :image])
    update_params[:exercises] = update_params[:exercises].present? ? JSON.parse(update_params[:exercises]) : ''
    update_params[:answers] = update_params[:answers].present? ? JSON.parse(update_params[:answers]) : ''
    return update_params
  end

  def page_index_params
    params.require(:lesson_page).permit(:index)
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
