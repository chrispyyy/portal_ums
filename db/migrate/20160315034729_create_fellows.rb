class CreateFellows < ActiveRecord::Migration
  def change
    create_table :fellows do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :email2
      t.string :password_digest
      t.timestamps null: false
      t.string :profile_picture
      t.string :super_power
      t.string :gender
      t.string :age
      t.string :phone_number
      t.string :personal_summary, limit: 1000
    end
  end
end
