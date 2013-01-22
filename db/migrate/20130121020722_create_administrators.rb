class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :email
      t.string :password_digest

    end
    add_index :administrators, :email, :unique => true
  end
end
