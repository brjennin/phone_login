class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :number, nil: false

      t.timestamps
    end

    add_index :phones, :number
  end
end
