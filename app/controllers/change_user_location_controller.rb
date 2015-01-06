class ChangeUserLocationController < ApplicationController
  before_action :signed_in_user
  before_action :init_form,  only: [:edit, :create]

  def edit
  end

  def create
    if @change_location_form.submit(params[:user_location_form])
      render 'verify_email_success'
    else
      render "new"
    end
  end
  
  private

    def init_form
      @user = current_user
      @change_location_form = ChangeUserLocationForm.new(@user)
    end
end