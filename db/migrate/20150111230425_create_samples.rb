class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.date :date
      t.time :time
      t.float :secchi_depth
      t.boolean :is_bottom
      t.integer :physical_appearance
      t.integer :recreational_suitability
      t.string :water_color
      t.text :notes

      t.timestamps null: false
    end
  end
end
