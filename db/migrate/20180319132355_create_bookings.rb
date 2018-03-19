class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :date
      t.integer :price
      t.references :service, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
