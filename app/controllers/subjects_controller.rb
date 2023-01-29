class SubjectsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @subjects = Subject.all
    @home_page = "subjects"
  end

  def update
  end

  def destroy
  end
end
