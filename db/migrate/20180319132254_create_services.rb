class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :contractor, foreign_key: true
      t.string :location
      t.references :picture, foreign_key: true

      t.timestamps
    end
  end
end
