class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|

      t.timestamps
      t.references :picturable, polymorphic: true, index: true, default: "none"
    end
  end
end
