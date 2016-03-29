class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :email2
      t.string :password_digest
      t.timestamps null: false
      # t.boolean :password_change_required, default: true
    end
  end
end