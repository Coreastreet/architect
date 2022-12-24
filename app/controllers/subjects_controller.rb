class SubjectsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @subjects = Subject.all
  end

  def update
  end

  def destroy
  end
end
