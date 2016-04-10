# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  # include ParamsMixin

  ############
  ## Admin
  ############
  Administrator.create!(first_name: "Ross", last_name: "Boss", email: "admin@cansbridge.ca", password:"password")

  ############
  ## Cansbridge Class Years
  ############
  # class_years = ['2011', '2012', '2013', '2014', '2015', '2016']

  ###############
  ## Cohorts
  ###############
  Cohort.delete_all

  # class_year_array = [
  #   {
  #     :name => 'Class of 2011',
  #     :year => '2011'
  #   },
  #   {
  #     :name => 'Class of 2012',
  #     :year => '2012'
  #   },
  #   {
  #     :name => 'Class of 2013',
  #     :year => '2013'
  #   }
  # ]
  # # Create a cohort
  # puts 'Creating Classes'
  #   class_year_array.each do |class_year|
  #     Cohort.create!(
  #       name: class_year[:name],
  #       year: class_year[:year]
  #     )
  #   end
  @cohort_2011 = Cohort.create!(name: 'Class of 2011', year:'2011')
  @cohort_2012 = Cohort.create!(name: 'Class of 2012', year:'2012')
  @cohort_2013 = Cohort.create!(name: 'Class of 2013', year:'2013')


  ###############
  ## Fellows
  ###############
  Fellow.delete_all

  @cohort_2011.fellows.create!(first_name: 'Chrispy', last_name: 'Brks', email: 'chrispy@brks.ca')
  @cohort_2012.fellows.create!(first_name: 'Ross', last_name: 'Boss', email: 'ross@boss.com')
  @cohort_2013.fellows.create!(first_name: 'Chris', last_name: 'Lab', email: 'chrislab@mosaic.ca')

  # fellows_array = [
  #   {
  #     first_name: 'Chrispy',
  #     last_name: 'Brks',
  #     email: 'chrispy@brks.ca'
  #   },
  #   {
  #     first_name: 'Ross',
  #     last_name: 'Kelly',
  #     email: 'ross@boss.ca'
  #   },
  #   {
  #     first_name: 'Chris',
  #     last_name: 'Labelle',
  #     email: 'chris@mosaic.ca'
  #   }
  # ]

  # puts 'Creating Fellows'
  #   fellows_array.each do |fellow|
  #     Fellow.create!(
  #       first_name: fellow[:first_name],
  #       last_name: fellow[:last_name],
  #       email: fellow[:email],
  #     )
  #   end

end
