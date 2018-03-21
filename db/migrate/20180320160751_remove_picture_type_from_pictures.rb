class RemovePictureTypeFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :picturable_type, :string
    remove_column :pictures, :picturable_id, :integer
    add_column :pictures, :service_id, :integer
  end
end
