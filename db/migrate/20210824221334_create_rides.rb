class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.boolean :roller_coaster
      t.integer :top_speed
      t.references :amusementpark, foreign_key: true
      t.timestamps
    end
  end
end
