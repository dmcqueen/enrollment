class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.integer :phone
      t.string :name
      t.integer :ssn
      t.string :type

      t.timestamps
    end

    add_index :users, ['email'], :name => "users_email_index"
  end

  def down
    drop_table :users
  end
end
