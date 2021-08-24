class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.boolean :roller_coaster
      t.integer :top_speed
      t.timestamps
    end
  end
end
