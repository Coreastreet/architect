class Admin::PagesController < ApplicationController
  def show
    @page = LessonPage.find(1)
    @lesson = @page.lesson
    @lesson_pages = @lesson.pages
  end

  def new
  end

  def index
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
