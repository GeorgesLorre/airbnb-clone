class RemovePictureIdFromService < ActiveRecord::Migration[5.1]
  def change
    remove_column :services, :picture_id, :integer
  end
end
