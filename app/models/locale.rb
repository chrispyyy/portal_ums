class Locale < ActiveRecord::Base

  belongs_to :fellow

  validates :city, presence: true, length: { maximum: 20 }
  validates :country, presence: true, length: { maximum: 20 }
  validates :year, presence: true, length: { maximum: 4 }

  # add dates later

end
