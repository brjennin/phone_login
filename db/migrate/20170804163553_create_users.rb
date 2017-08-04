class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, nil: false
      t.string :email, nil: false
      t.string :password_digest, nil: false

      t.timestamps
    end
  end
end
