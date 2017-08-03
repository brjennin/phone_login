class CreateVerificationLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :verification_links do |t|
      t.string :code, nil: false
      t.belongs_to :phone, foreign_key: true, nil: false

      t.timestamps
    end

    add_index :verification_links, :code
  end
end
