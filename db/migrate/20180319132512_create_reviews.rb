class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.references :picture, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
