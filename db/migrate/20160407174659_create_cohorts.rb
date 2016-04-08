class CreateCohorts < ActiveRecord::Migration

  def up

    create_table :cohorts do |t|
      t.string :name
      t.string :year
      t.timestamps null: false
    end

    class_year_array = [
      {
        :name => 'Class of 2011',
        :year => '2011'
      },
      {
        :name => 'Class of 2012',
        :year => '2012'
      },
      {
        :name => 'Class of 2013',
        :year => '2013'
      },
      {
        :name => 'Class of 2014',
        :year => '2014'
      },
      {
        :name => 'Class of 2015',
        :year => '2015'
      },
      {
        :name => 'Class of 2016',
        :year => '2016'
      }
    ]

    puts 'Creating Classes'
      class_year_array.each do |class_year|
        Cohort.create!(
          name: class_year[:name],
          year: class_year[:year]
        )
      end

  end

  def down
    Cohort.destroy_all
  end

end
