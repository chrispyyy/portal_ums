class Fellow < ActiveRecord::Base

  belongs_to :cohort

  validates :name, presence: true, length: { maximum: 20 }
  validates :year, presence: true, length: { maximum: 4 }

end
