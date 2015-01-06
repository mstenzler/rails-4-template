class UserLocationForm
  include ActiveModel::Model

  def persisted?
    false
  end

  attr_accessor :zip_code, :geo_country_id

  validates :zip_code, presence: true
  validates :geo_country_id, presence: true

 # validate :check_email

#  validate :verify_token_is_valid
#  validates_confirmation_of :new_password
#  validates_length_of :new_password, minimum: 6

  def initialize(user)
    @user = user
    @zip_code = @user.zip_code if @user.zip_code
    @geo_country_id = @user.geo_country_id if @user.geo_country_id
  end

  def submit(params)
    self.zip_code = params[:zip_code]
    self.geo_country_id = params[:geo_country_id]
    if valid?
      @user.geo_country_id = self.geo_country_id
      @user.zip_code = self.zip_code
      if (@user.proccess_geo_area)
        @user.save
      else
        errors.add(:zip_code, "Could not find location for this country and zip code")
        false
      end
    else
      false
    end
  end

=begin
  def check_email
    if @user.email == self.email
      errors.add :email, "already the current email"
    end
    if User.find_by_email(self.email)
      errors.add :email, "Already taken"
    end
  end
=end

end