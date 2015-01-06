class UserLocationsController < ApplicationController
  before_action :signed_in_user
  before_action :init_form,  only: [:edit, :update]

  def edit
    load_country
  end

  def update
    if @user_location_form.submit(params[:user_location_form])
      redirect_to edit_user_url(@user), :notice => "Location has been changed."
    else
      load_country
      render "edit"
    end
  end
  
  private

    def init_form
      @user = current_user
      @user_location_form = UserLocationForm.new(@user)
    end

    def load_country
      @countries = GeoCountry.get_country_list({default_country: CONFIG[:default_country],
                                              force_reaload: true})
    end
end