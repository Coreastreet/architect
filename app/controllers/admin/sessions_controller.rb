class Admin::SessionsController < ApplicationController
  def new
     @new_creator = Creator.new
  end

  def create
    creator = Creator.find_by(email: login_params[:email])
    if (creator && creator.authenticate(login_params[:password]))
      # add is email verified later
      auth_token = JsonWebToken.encode({creator_id: creator.id})
      cookies[:auth_token] = { value: auth_token }

      redirect_to admin_subjects_path
    else 
      if creator.nil?
          @error_message = "This user does not exist."
      else 
          if (creator.authenticate(login_params[:password]) == false)    
             @error_message = "Password was incorrect. Please try again."
          else 
             @error_message = "Unknown error. Investigate further"
          end
      end
    end
  end

  def destroy
      cookies.delete(:auth_token)
      current_creator = nil
      redirect_to root_url
  end

  private 

  def login_params
      params.require(:session).permit(:email, :password)
  end
end
