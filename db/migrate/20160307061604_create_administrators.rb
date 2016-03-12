class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :first_name, limit: 255
      t.string :last_name, limit: 255
      t.string :email, limit: 255
      t.string :email2, limit: 255
      t.string :password_digest
      t.timestamps null: false
      # t.boolean :password_change_required, default: true
    end
  end
end