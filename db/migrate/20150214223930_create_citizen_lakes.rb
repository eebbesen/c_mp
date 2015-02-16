class CreateCitizenLakes < ActiveRecord::Migration
  def change
    create_table :citizen_lakes do |t|
      t.belongs_to :lake, index: true
      t.belongs_to :citizen, index: true
      t.boolean :previous_year

      t.timestamps null: false
    end

    remove_column :lakes, :sample_depth, :float
    remove_column :lakes, :previous_year, :boolean

    add_column :samples, :sample_depth, :float
  end
end
