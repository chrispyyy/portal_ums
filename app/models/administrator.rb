class Administrator < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }, if: :validate_password?
  
  has_secure_password

  scope :assigned_to_city, -> (city) { where('admissions_for_cities ILIKE ?', "%#{city}%") }
  scope :assigned_to_any_city, -> { where('admissions_for_cities IS NOT NULL') }
  scope :invoicer, -> { where(invoicer: true) }


  def full_name
    "#{first_name} #{last_name}"
  end

  def change_password(params)
    self.password = params[:password]
    self.password_confirmation = params[:password_confirmation]
    self.password_change_required = false
    @validate_password = true
    save
  end


  private 

  def validate_password?
    new_record? || @validate_password
  end
end
