class CreateLocales < ActiveRecord::Migration
  def change
    create_table :locales do |t|
      t.string :city
      t.string :country
      t.date :period
      t.timestamps null: false
      t.references :fellow
    end
  end
end
