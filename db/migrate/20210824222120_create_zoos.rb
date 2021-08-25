class CreateZoos < ActiveRecord::Migration[5.2]
  def change
    create_table :zoos do |t|
      t.string :name
      t.integer :rank
      t.boolean :state_funding
      t.string :city
      t.timestamps
    end
  end
end
