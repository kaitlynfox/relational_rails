class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.boolean :certified_trainer
      t.integer :years_of_experience
      t.references :zoo, foreign_key: true
      t.timestamps
    end
  end
end
