class CreateLakes < ActiveRecord::Migration
  def change
    create_table :lakes do |t|
      t.string :lake_name
      t.string :lake_number
      t.string :site_number
      t.string :county
      t.float :sample_depth
      t.boolean :previous_year

      t.timestamps null: false
    end
  end
end
