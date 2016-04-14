class Cohort < ActiveRecord::Base

  validates :name, presence: true
  validates :year, uniqueness: true, presence: true, length: { maximum: 4 }, numericality: { only_integer: true }

  has_many :fellows

  before_destroy :check_destroyability


  CLASS_YEARS =  ['2011', '2012', '2013', '2014', '2015', '2016']

  def check_destroyability
    if fellows.present?
      errors.add :base, "Can't be deleted because it has Fellows attached to this class"
      return false
    end
    true
  end

end
