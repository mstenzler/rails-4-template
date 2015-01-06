class ChangeAvatarsController < ApplicationController
  before_action :signed_in_user
  before_action :init_form

 	def edit
	  unless @user
	  	display_error("Current user does not exist")
	  end
	end

 	def update
	  unless @user
	  	display_error("Current user does not exist")
	  	return
	  end
	  if check_params && @user.update_attributes(user_params)
	    redirect_to edit_user_url(@user), :notice => "Avatar has been changed."
	  else
	    render :edit
	  end
	end

  private

    def init_form
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:avatar, :avatar_type)
    end

    def check_params
      pms = user_params
      if (pms[:avatar_type] == User::UPLOAD_AVATAR && pms[:avatar].blank?)
        @user.errors.add(:avatar, "Must not be blank")
        return false
      end
      true
    end
end
