class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email_address
      t.string :bio
      t.string :password_digest
      t.boolean :instructor, default:false

      t.timestamps null: false
    end
  end
end
