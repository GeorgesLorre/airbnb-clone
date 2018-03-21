class AddPictureToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :photo, :string
  end
end
