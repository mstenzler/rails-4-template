class ChangeUsernamesController < ApplicationController
  before_action :signed_in_user
  before_action :init_form, only: [:edit, :update]

 	def edit
  end

 	def update
	  if @user.update_attributes(user_params)
	    redirect_to edit_user_url(@user), :notice => "Username has been changed."
	  else
	    render :edit
	  end
	end

  private
    def init_form
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:username)
    end
end
