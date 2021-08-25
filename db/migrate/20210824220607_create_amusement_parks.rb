class CreateAmusementParks < ActiveRecord::Migration[5.2]
  def change
    create_table :amusement_parks do |t|
      t.string :name
      t.integer :cost_of_entry
      t.boolean :open_year_round
      t.timestamps
    end
  end
end
