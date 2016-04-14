class Fellow < ActiveRecord::Base

  belongs_to :cohort

  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  # validates :year, presence: true, length: { maximum: 4 }


  def full_name
    "#{first_name} #{last_name}"
  end

end
