class Admin::LessonsController < ApplicationController
  layout "admin"

  before_action :authenticate

  def new
      @new_lesson = Lesson.new # actually new_lesson
      @subject = Subject.find_by(title: subject_title_param)
  end

  def create
      lesson_params[:title].capitalize!
      @subject = Subject.find_by(title: subject_title_param)
      full_lesson_params = lesson_params.merge(subject_id: @subject.id)
      full_lesson_params[:objectives] = JSON.parse(full_lesson_params[:objectives])

      Lesson.create!(full_lesson_params)
      redirect_to admin_subject_lessons_path(@subject)
  end

  def show 
      @lesson = Lesson.find_by(title: lesson_title_param)
      @subject = @lesson.subject
  end

  def index_show
      @lesson = Lesson.find_by(title: lesson_title_param)

      @subject = @lesson.subject
      @lessons = Lesson.find(@subject.lesson_id_order)
  end

  def index
      @subject = Subject.find_by(title: subject_title_param)
      @lessons = Lesson.find(@subject.lesson_id_order)
      @first_lesson = @lessons.first
  end

  def edit
      @lesson = Lesson.find_by(title: lesson_title_param)
      @subject = @lesson.subject
  end

  def update
      lesson = Lesson.find_by(title: lesson_title_param)
      subject = lesson.subject
      # capitalize before saving
      lesson_params[:title].capitalize!
      lesson.update!(lesson_params)

      redirect_to admin_lesson_path(lesson)
  end

  def destroy
      lesson = Lesson.find_by(title: lesson_title_param)
      lesson.destroy!

      subject = lesson.subject

      redirect_to admin_subject_lessons_path(subject)
  end

  private 

  def lesson_params
    less_params = params.require(:lesson).permit(:title, :subtitle, :description, :image, :objectives)
    less_params[:objectives] = less_params[:objectives].present? ? JSON.parse(less_params[:objectives]) : ''
    return less_params
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
