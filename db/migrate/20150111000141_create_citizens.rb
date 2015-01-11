class CreateCitizens < ActiveRecord::Migration
  def change
    create_table :citizens do |t|
      t.string :first_name
      t.string :last_name
      t.integer :clmp_number
      t.string :email
      t.string :phone_1
      t.string :phone_2

      t.timestamps null: false
    end
  end
end
