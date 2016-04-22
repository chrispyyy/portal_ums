class Fellow < ActiveRecord::Base

  belongs_to :cohort
  has_many :locales

  # accepts_nested_attributes_for :locales, allow_destroy: true, reject_if: :all_blank

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  # validates :year, presence: true, length: { maximum: 4 }


  def full_name
    "#{first_name} #{last_name}"
  end

end
