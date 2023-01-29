class Admin::SubjectsController < ApplicationController
  layout "admin"

  before_action :authenticate

  def index
    @recently_updated_pages = LessonPage.order(updated_at: :desc).limit(5)
    @subjects = current_creator.subjects
    @new_subject = Subject.new
  end

  def create
    subject_params[:title].capitalize!
    @subject = Subject.create!(subject_params)
  end

  def edit
    @subject = Subject.find_by(title: subject_title_param)
  end

  def destroy
    subject = Subject.find_by(title: subject_title_param)
    subject.destroy!
    redirect_to admin_subjects_path
  end

  def update
    @subject = Subject.find_by(title: subject_title_param)
    # capitalize title before saving
    subject_params[:title].capitalize!
    @subject.update!(subject_params)
    
    flash[:notice] = 'Subject updated successfully'
    redirect_to admin_subjects_path
  end

  private 

  def subject_params
    params.require(:subject).permit(:title, :subtitle, :image).merge(creator_id: current_creator.id)
  end

  private

  def subject_title_param
    title = deslug(params[:subject_slug])
  end

  def deslug(str)
    if str.present?
      str.gsub("-", " ").capitalize
    end
  end

end
