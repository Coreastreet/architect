class PagesController < ApplicationController
  def home
  end

  def about
    @home_page = "about"
  end

  def recruiters
    @home_page = "recruiters"
  end
end
