class RemovePictureTypeFromPictures < ActiveRecord::Migration[5.1]
  def change

    add_column :pictures, :service_id, :integer
  end
end
