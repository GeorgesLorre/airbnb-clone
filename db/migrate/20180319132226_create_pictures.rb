class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|

      t.timestamps
      t.references :service
    end
  end
end
